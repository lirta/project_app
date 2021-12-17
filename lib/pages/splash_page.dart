// import 'dart:async';

// import 'package:another_flushbar/flushbar.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/provider/device_provider.dart';
import 'package:my_first/theme.dart';
import 'package:my_first/provider/member_provider.dart';
import 'package:provider/provider.dart';
import 'package:device_info/device_info.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:location/location.dart' as location;
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

class _SplashPageState extends State<SplashPage> {
  String lat = "", long = "";
  // bool isLogin = false;
  String id = "";
  void initState() {
    getInit();
    cekLogin();
    super.initState();
  }

  cekLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getBool("is_login");
    id = prefs.getString("id");
    // print(id);
    // print(isLogin);

    // ignore: unrelated_type_equality_checks
    if (isLogin == true) {
      AuthProvider authProvider =
          Provider.of<AuthProvider>(context, listen: false);
      if (await authProvider.getUser(id: id)) {
        Navigator.pushNamed(context, '/home');
        print("sudah login");
      } else {
        print("error get data");
        Navigator.pushNamed(context, '/log-in');
        print(isLogin);
        print(id);
      }
    } else {
      print("belumlogin");
      Navigator.pushNamed(context, '/log-in');
    }
  }

  getInit() async {
    await Provider.of<MemberProvider>(context, listen: false).getMember();
    DeviceInfoPlugin _devceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

    DeviceProvider deviceProvider =
        Provider.of<DeviceProvider>(context, listen: false);

    var imei = await ImeiPlugin.getImei();
    String userId = "0";

    if (!mounted) return;
    bool _serviceEnabled;
    _serviceEnabled = await location.Location().serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.Location().requestService();
      if (!_serviceEnabled) {
        print("Location service disabled.");
        lat = "";
        long = "";
      } else {
        await getPermissionLocation();
      }
    } else {
      await getPermissionLocation();
    }

    if (Platform.isAndroid) {
      var deviceOsType = "Android";
      AndroidDeviceInfo androidInfo = await _devceInfoPlugin.androidInfo;
      print(androidInfo.androidId);
      print(userId);
      print(androidInfo.model);
      print(androidInfo.manufacturer + androidInfo.model);
      print(androidInfo.manufacturer);
      print(androidInfo.model);
      print(androidInfo.version.sdkInt.toString());
      print(androidInfo.product);
      print(androidInfo.version.release);
      print(androidInfo.board);
      print(androidInfo.brand);
      print(androidInfo.host);
      print(androidInfo.type);
      print("imei");
      print(imei);
      print("lokasi saat ini");
      print(lat);
      print(long);
      if (await deviceProvider.postDevice(
          deviceId: androidInfo.androidId,
          userId: userId,
          deviceOsType: deviceOsType,
          deviceName: androidInfo.manufacturer + androidInfo.model,
          deviceManufactur: androidInfo.manufacturer,
          deviceModel: androidInfo.model,
          deviceSDK: androidInfo.version.sdkInt.toString(),
          deviceProduct: androidInfo.product,
          deviceOsVersion: androidInfo.version.release,
          deviceBoard: androidInfo.board,
          deviceBrand: androidInfo.brand,
          deviceDisplay: androidInfo.display,
          deviceHardware: androidInfo.hardware,
          deviceHost: androidInfo.host,
          deviceType: androidInfo.type,
          deviceImei: imei,
          deviceLat: lat,
          deviceLong: long)) {
        print("inser data device berhasil");
      } else {
        print("inser data device gagal");
      }
    } else if (Platform.isIOS) {
      var deviceOsType = "iOS";
      IosDeviceInfo iosInfo = await _devceInfoPlugin.iosInfo;
      print("Device Info: Ios");
      print(iosInfo.identifierForVendor);
      print(iosInfo.isPhysicalDevice);
      print(iosInfo.name);
      print(iosInfo.runtimeType);
      print(androidInfo.model);
      print(androidInfo.manufacturer);
      print(androidInfo.version.sdkInt.toString());
      print(androidInfo.product);
      print(androidInfo.host);
      print("imei");
      print(imei);
      print("lokasi saat ini");
      print(lat);
      print(long);
      if (await deviceProvider.postDevice(
          deviceId: iosInfo.identifierForVendor,
          userId: userId,
          deviceOsType: deviceOsType,
          deviceName: iosInfo.name,
          deviceManufactur: "0",
          deviceModel: iosInfo.model,
          deviceSDK: "0",
          deviceProduct: "0",
          deviceOsVersion: iosInfo.systemName,
          deviceBoard: "0",
          deviceBrand: "0",
          deviceDisplay: "0",
          deviceHardware: "0",
          deviceHost: "0",
          deviceType: "0",
          deviceImei: imei,
          deviceLat: lat,
          deviceLong: long)) {
        print("inser data device berhasil");
      } else {
        print("inser data device gagal");
      }
    }
  }

  getPermissionLocation() async {
    if (mounted) {
      location.PermissionStatus _permissionGranted;
      location.LocationData _locationData;
      _permissionGranted = await location.Location().hasPermission();
      print("Permission location hasPermission?");
      if (_permissionGranted == location.PermissionStatus.denied) {
        _permissionGranted = await location.Location().requestPermission();
        if (_permissionGranted != location.PermissionStatus.granted) {
          print("Permission location denied.");
          lat = "";
          long = "";
        } else {
          print("Permission location granted 2nd time.");
          _locationData = await new location.Location().getLocation();
          lat = _locationData.latitude.toString();
          long = _locationData.longitude.toString();
        }
      } else if (_permissionGranted == location.PermissionStatus.granted) {
        print("Permission location granted.");
        _locationData = await new location.Location().getLocation();
        lat = _locationData.latitude.toString();
        long = _locationData.longitude.toString();
      }
    }
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
