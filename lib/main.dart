import 'package:flutter/material.dart';
import 'package:my_first/pages/splash_page.dart';
import 'package:my_first/pages/login_page.dart';
import 'package:my_first/pages/sing_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        '/':(context) => SplashPage(),
        '/log-in': (context) =>LoginPage(),
        '/sing-up': (context) =>SingupPage(),
      },
    );
  }
}


