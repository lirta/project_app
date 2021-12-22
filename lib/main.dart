import 'package:flutter/material.dart';
import 'package:my_first/pages/edit_email_page.dart';
import 'package:my_first/pages/edit_password_page.dart';
import 'package:my_first/pages/edit_profile_page.dart';
import 'package:my_first/pages/edit_username_page.dart';
import 'package:my_first/pages/login_otp.dart';
import 'package:my_first/pages/main_page.dart';
import 'package:my_first/pages/profile_page.dart';
import 'package:my_first/pages/splash_page.dart';
import 'package:my_first/pages/login_page.dart';
import 'package:my_first/pages/sing_up_page.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/provider/device_provider.dart';
import 'package:my_first/provider/member_provider.dart';
import 'package:provider/provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  //Remove this method to stop OneSignal Debugging
  // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.shared.init("b2feb0ca-6821-4983-90f2-c05b85250d4d");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => MemberProvider()),
        ChangeNotifierProvider(create: (context) => DeviceProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/log-in': (context) => LoginPage(),
          '/sing-up': (context) => SingupPage(),
          '/home': (context) => MainPage(),
          '/profile': (context) => ProfilePage(),
          '/edit-password': (context) => EditPasswordPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/edit-username': (context) => EditUsername(),
          '/edit-email': (context) => EditEmail(),
          'login-otp': (context) => LoginOtp(),
        },
      ),
    );
  }
}
