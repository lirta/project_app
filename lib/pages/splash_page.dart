// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first/theme.dart';
import 'package:my_first/provider/member_provider.dart';
import 'package:provider/provider.dart';
import 'package:device_info/device_info.dart';
import 'package:imei_plugin/imei_plugin.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

class _SplashPageState extends State<SplashPage> {
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<MemberProvider>(context, listen: false).getMember();
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

    var imei = await ImeiPlugin.getImei();
    print("Device Info:");
    print(androidInfo.androidId);
    print(androidInfo.device);
    print(androidInfo.id);
    print(androidInfo.type);
    print(androidInfo.model);
    print(androidInfo.manufacturer);
    print(androidInfo.version.sdkInt.toString());
    print(androidInfo.product);
    print(androidInfo.host);
    print("imei");
    print(imei);
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
