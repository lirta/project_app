import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/theme.dart';
import 'package:email_auth/email_auth.dart';
import 'package:provider/provider.dart';

class LoginOtp extends StatefulWidget {
  @override
  _LoginOtpState createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController otpController = TextEditingController(text: '');
  bool isLoading = false;
  EmailAuth emailAuth = new EmailAuth(sessionName: "simple session");

  void sendOTP() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    if (await authProvider.getuser(email: emailController.text)) {
      var result = await emailAuth.sendOtp(recipientMail: emailController.text);
      if (result) {
        print("send");
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: blueColor,
          message: 'Periksa Email anda, OTP terkirim',
        ).show(context);
      } else {
        print("error");
      }
    } else {
      Flushbar(
        duration: Duration(seconds: 4),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Color(0xffff5c83),
        message: 'Email anda belum terdaftar',
      ).show(context);
    }
  }

  void verifyOTP() {
    var result = emailAuth.validateOtp(
        recipientMail: emailController.text, userOtp: otpController.text);
    if (result) {
      Navigator.pushNamed(context, '/home');
    } else {
      Flushbar(
        duration: Duration(seconds: 4),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Color(0xffff5c83),
        message: 'Gagal verified OTP',
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        // margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign In',
              style: bTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign in to continue',
              style: wTextStyle,
            )
          ],
        ),
      );
    }

    Widget email() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: bTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: emailController,
                      style: bTextStyle,
                      decoration:
                          InputDecoration.collapsed(hintText: 'Email Address'),
                    )),
                    TextButton(
                        onPressed: () => sendOTP(), child: Text('Send OTP')),
                    // GestureDetector(
                    //   onTap: () {},

                    //   child: Text("Send OTP"),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget otp() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OTP',
              style: bTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: otpController,
                      style: bTextStyle,
                      // obscureText: true,
                      decoration: InputDecoration.collapsed(hintText: 'OTP'),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget verifyOtp() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () => verifyOTP(),
          style: TextButton.styleFrom(
              backgroundColor: blueColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: isLoading == false
              ? Text('Verify OTP', style: wTextStyle)
              : CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(whiteColor),
                ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [header(), email(), otp(), verifyOtp()],
            ),
          ),
        ),
      ),
    );
  }
}
