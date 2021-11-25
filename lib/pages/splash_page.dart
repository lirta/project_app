// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first/theme.dart';
import 'package:my_first/provider/member_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
   await Provider.of<MemberProvider>(context, listen: false).getMember();
     Navigator.pushNamed(context, '/log-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          width: 201,
          height: 303,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/Logo.png'))),
        ),
      ),
    );
  }
}
