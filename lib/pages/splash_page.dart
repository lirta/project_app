// import 'dart:async';

// import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_first/provider/device_provider.dart';
import 'package:my_first/theme.dart';
import 'package:my_first/provider/member_provider.dart';
import 'package:provider/provider.dart';
import 'package:device_info/device_info.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:location/location.dart' as location;

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

class _SplashPageState extends State<SplashPage> {
  String lat = "", long = "";
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<MemberProvider>(context, listen: false).getMember();
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

    DeviceProvider deviceProvider =
        Provider.of<DeviceProvider>(context, listen: false);

    var imei = await ImeiPlugin.getImei();
    var userId = 0;
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
    print("lokasi saat ini");
    print(lat);
    print(long);
    if (await deviceProvider.postDevice(
        androidId: androidInfo.androidId,
        device: androidInfo.device,
        deviceId: androidInfo.id,
        deviceType: androidInfo.type,
        deviceModel: androidInfo.model,
        deviceManufactur: androidInfo.manufacturer,
        deviceVersionSDK: androidInfo.version.sdkInt.toString(),
        deviceProduct: androidInfo.product,
        deviceHost: androidInfo.host,
        imei: imei,
        lat: lat,
        long: long,
        userId: userId.toString())) {
      Navigator.pushNamed(context, '/log-in');
    } else {
      Navigator.pushNamed(context, '/log-in');
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

      // getIndex(lat, long);
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
