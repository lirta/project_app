import 'package:flutter/material.dart';
import 'package:my_first/theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              'Email Address',
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
          onPressed: () {},
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