import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/theme.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  GlobalKey<FormState> formKy = GlobalKey<FormState>();
  GlobalKey<ScaffoldMessengerState> scaffolMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLoginGoogle() async {
      var _googleSignin = GoogleSignIn();
      GoogleSignInAccount _googleAccount;
      _googleAccount = await _googleSignin.signIn();
      print(_googleAccount.displayName);
      print(_googleAccount.email);
      print(_googleAccount.id);
      print(_googleAccount.photoUrl);
      if (await authProvider.loginGoogle(
          name: _googleAccount.displayName,
          email: _googleAccount.email,
          gambar: _googleAccount.photoUrl)) {
        Navigator.pushNamed(context, '/home');
      }
    }

    handleLogin() async {
      setState(() {
        isLoading = true;
      });
      if (!(passwordController.text.trim() != "" &&
          emailController.text.trim() != "")) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'fild tidak boleh kosong',
        ).show(context);
      } else if (!(passwordController.text.length >= 6)) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'Password minimal 6 character',
        ).show(context);
      } else {
        if (await authProvider.login(
            email: emailController.text, password: passwordController.text)) {
          Navigator.pushNamed(context, '/home');
        } else {
          Flushbar(
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xffff5c83),
            message: 'Login Gagal. Email/Username dan password salah',
          ).show(context);
        }
        // print("NAVIGASI KE HOME PAGE");
      }
      setState(() {
        isLoading = false;
      });
    }

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
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email atau username',
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
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget password() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
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
                      controller: passwordController,
                      style: bTextStyle,
                      obscureText: true,
                      decoration:
                          InputDecoration.collapsed(hintText: 'Password'),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget loginBotton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleLogin,
          style: TextButton.styleFrom(
              backgroundColor: blueColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: isLoading == false
              ? Text('Sign In', style: wTextStyle)
              : CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(whiteColor),
                ),
        ),
      );
    }

    Widget loginEmail() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleLoginGoogle,
          style: TextButton.styleFrom(
              backgroundColor: yColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: 
          // isLoading == false
          //     ? 
              Text('Sign With Email', style: bTextStyle),
              // : CircularProgressIndicator(
              //     strokeWidth: 2,
              //     valueColor: AlwaysStoppedAnimation(whiteColor),
              //   ),
        ),
      );
    }

    Widget registrasi() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum Punya Account ! ',
              style: bTextStyle,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sing-up');
              },
              child: Text(
                'Sign Up ',
                style: yTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            )
          ],
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
              children: [
                header(),
                email(),
                password(),
                loginBotton(),
                loginEmail(),
                registrasi()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
