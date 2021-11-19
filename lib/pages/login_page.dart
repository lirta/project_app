import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogin() async {
      if (await authProvider.login(
          email: emailController.text, password: passwordController.text)) {
        Navigator.pushNamed(context, '/profile');
      }
    }

    Widget header() {
      return Container(
        // margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: bTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sing In to Continue',
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
                        child: TextField(
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
          onPressed: () {
            if (!(passwordController.text.trim() != "" &&
                emailController.text.trim() != "")) {
              Flushbar(
                duration: Duration(milliseconds: 1500),
                flushbarPosition: FlushbarPosition.TOP,
                backgroundColor: Color(0xffff5c83),
                message: 'fild tidak boleh kosong',
              ).show(context);
            } else if (!(passwordController.text.length >= 6)) {
              Flushbar(
                duration: Duration(milliseconds: 1500),
                flushbarPosition: FlushbarPosition.TOP,
                backgroundColor: Color(0xffff5c83),
                message: 'Password minimal 6 character',
              ).show(context);
            } else {
              handleLogin();
            }
          },
          style: TextButton.styleFrom(
              backgroundColor: blueColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text('Log In', style: wTextStyle),
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
                'Sing Up ',
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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              email(),
              password(),
              loginBotton(),
              registrasi()
            ],
          ),
        ),
      ),
    );
  }
}
