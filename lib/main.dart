import 'package:flutter/material.dart';
import 'package:my_first/pages/edit_password_page.dart';
import 'package:my_first/pages/edit_profile_page.dart';
import 'package:my_first/pages/profile_page.dart';
import 'package:my_first/pages/splash_page.dart';
import 'package:my_first/pages/login_page.dart';
import 'package:my_first/pages/sing_up_page.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/log-in': (context) => LoginPage(),
          '/sing-up': (context) => SingupPage(),
          '/profile': (context) => ProfilePage(),
          '/edit-password': (context) => EditPasswordPage(),
          '/edit-profile': (context) => EditProfilePage(),
        },
      ),
    );
  }
}
