// import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:my_first/model/device_model.dart';
// import 'package:my_first/model/device_model.dart';
// import 'package:my_first/model/device_model.dart';
import 'package:my_first/model/user_model.dart';
import 'package:my_first/pages/member_title.dart';
import 'package:my_first/pages/splash_page.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/provider/device_provider.dart';
// import 'package:my_first/provider/device_provider.dart';
import 'package:my_first/provider/member_provider.dart';
import 'package:my_first/services/server.dart';
import 'package:my_first/theme.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:location/location.dart' as location;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lat = "", long = "";
  String title = "", body = "";
  @override
  void initState() {
    _getCurrentLocation();
    _refreshMember(context);
    // getPermissionLocation();
    super.initState();
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      setState(() {
        title = notification.payload.title;
        body = notification.payload.body;
      });
    });
  }

  _getCurrentLocation() async {
    DeviceProvider deviceProvider =
        Provider.of<DeviceProvider>(context, listen: false);
    DeviceModel dataDevice = deviceProvider.dataDevice;
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    UserModel user = authProvider.user;
    if (!mounted) return;

    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      lat = _locationData.latitude.toString();
      long = _locationData.longitude.toString();
    });
    print("latitude : " + lat);
    print("longitude : " + long);
    print(user.id);
    print(dataDevice.deviceId);
    await deviceProvider.updateDevice(
        userId: user.id,
        deviceId: dataDevice.deviceId,
        deviceLat: lat,
        devicelong: long);
  }

  Future<void> _refreshMember(BuildContext context) async {
    await Provider.of<MemberProvider>(context, listen: false).getMember();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    MemberProvider memberProvider = Provider.of<MemberProvider>(context);
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: wTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                  ),
                  // Text(
                  //   '${user.username}',
                  //   style: wTextStyle.copyWith(
                  //     fontSize: 16,
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(gambarUrl + user.gambar)),
              ),
            ),
          ],
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'List Member',
          style: wTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: memberProvider.member
              .map(
                (member) => MemeberTitle(member),
              )
              .toList(),
        ),
      );
    }

    // return Scaffold(
    //     backgroundColor: blueColor,
    //     resizeToAvoidBottomInset: false,
    //     body: SafeArea(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [header(), newArrivalsTitle()],
    //       ),
    //     ));
    return RefreshIndicator(
      // onRefresh: refresh,
      onRefresh: () => _refreshMember(context),
      // () => _refreshMember(),
      child: Container(
        child: ListView(
          children: [
            header(),
            newArrivalsTitle(),
            newArrivals(),
          ],
        ),
      ),
    );
  }
}
