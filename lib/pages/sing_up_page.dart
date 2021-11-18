import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first/model/user_model.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/theme.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController phoneController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  // Future Register() async {
  //   var url = "http://10.0.2.2/api/register.php";
  //   var response = await http.post(Uri.parse(url), body: {
  //     "name": nameController.text,
  //     "username": usernameController.text,
  //     "email": emailController.text,
  //     "password": passwordController.text,
  //   });

  //   var data = jsonDecode(response.body)['user'];
  //   print(response.body);
  //   if (response.body == "true") {
  //   } else {
  //     Navigator.pushNamed(context, '/profile');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSingUp() async {
      if (await authProvider.register(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text)) {
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
              'Sing Up',
              style: bTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Input your data',
              style: wTextStyle,
            )
          ],
        ),
      );
    }

    Widget name() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
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
                      controller: nameController,
                      decoration:
                          InputDecoration.collapsed(hintText: 'Full Name'),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget username() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
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
                      controller: usernameController,
                      decoration:
                          InputDecoration.collapsed(hintText: 'Username'),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget email() {
      return Container(
        margin: EdgeInsets.only(top: 16),
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
                      controller: emailController,
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
        margin: EdgeInsets.only(top: 16),
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
                      controller: passwordController,
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

    Widget singupBotton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleSingUp,
          //     () {
          //   Register();
          // },
          style: TextButton.styleFrom(
              backgroundColor: blueColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text('Sing Up', style: wTextStyle),
        ),
      );
    }

    Widget login() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log In ',
              style: bTextStyle.copyWith(),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/log-in');
                },
                child: Text(
                  ' New',
                  style: yTextStyle.copyWith(fontWeight: FontWeight.bold),
                ))
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
                name(),
                username(),
                email(),
                password(),
                singupBotton(),
                login(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
