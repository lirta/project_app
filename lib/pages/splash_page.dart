// import 'dart:async';

// import 'package:another_flushbar/flushbar.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_first/model/device_model.dart';
import 'package:my_first/services/server.dart';
// import 'package:my_first/provider/device_provider.dart';
import 'package:my_first/theme.dart';
import 'package:my_first/provider/member_provider.dart';
import 'package:provider/provider.dart';
import 'package:device_info/device_info.dart';
// import 'package:imei_plugin/imei_plugin.dart';
import 'package:http/http.dart' as http;

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
  // ignore: override_on_non_overriding_member
  // DeviceProvider deviceProvider = Provider.of<DeviceProvider>(context);
   getInit() async {
    await Provider.of<MemberProvider>(context, listen: false).getMember();
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    // DeviceProvider deviceProvider = Provider.of<DeviceProvider>(context, listen: false);

    // var imei = await ImeiPlugin.getImei();
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
    // print(imei);
    var url = '$baseUrl' + 'add_device.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'androidId': androidInfo.androidId,
        'device': androidInfo.device,
        'deviceId': androidInfo.id,
        'devdeviceType': androidInfo.type,
        'devdeviceModel': androidInfo.model,
        'devdeviceManufactur': androidInfo.manufacturer,
        'devdeviceVersionSDK': androidInfo.version.sdkInt.toString(),
        'devdeviceProduct': androidInfo.product,
        'devdeviceHost': androidInfo.host,
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['device'];
      DeviceModel dataDevice = DeviceModel.formJson(data);

      return dataDevice;
    } else {
      throw Exception('gagal insert data device');
    }
  }

 

  @override
  

  //
  // void insertDevice() async {
  //   AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
  //   DeviceProvider deviceProvider = Provider.of<DeviceProvider>(context);

  //   var imei = await ImeiPlugin.getImei();
  //   print("Device Info:");
  //   print(androidInfo.androidId);
  //   print(androidInfo.device);
  //   print(androidInfo.id);
  //   print(androidInfo.type);
  //   print(androidInfo.model);
  //   print(androidInfo.manufacturer);
  //   print(androidInfo.version.sdkInt.toString());
  //   print(androidInfo.product);
  //   print(androidInfo.host);
  //   print("imei");
  //   print(imei);
  //   if (await deviceProvider.postDevice(
  //       androidId: androidInfo.androidId,
  //       device: androidInfo.device,
  //       deviceId: androidInfo.id,
  //       deviceType: androidInfo.type,
  //       deviceModel: androidInfo.model,
  //       deviceManufactur: androidInfo.manufacturer,
  //       deviceVersionSDK: androidInfo.version.sdkInt.toString(),
  //       deviceProduct: androidInfo.product,
  //       deviceHost: androidInfo.host)) {
  //     Navigator.pushNamed(context, '/log-in');
  //   } else {
  //     Flushbar(
  //       duration: Duration(seconds: 4),
  //       flushbarPosition: FlushbarPosition.TOP,
  //       backgroundColor: Color(0xffff5c83),
  //       message: 'Gagal inser device',
  //     ).show(context);
  //   }
  // }

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
