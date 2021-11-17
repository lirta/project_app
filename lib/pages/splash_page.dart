import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/log-in'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          width: 251,
          height: 353,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/Logo.png'))),
        ),
      ),
    );
  }
}
