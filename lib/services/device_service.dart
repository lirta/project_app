import 'dart:convert';

import 'package:my_first/model/device_model.dart';
import 'package:my_first/services/server.dart';
import 'package:http/http.dart' as http;

class DeviceService {
  // ignore: missing_return
  Future<DeviceModel> postDevice(
      {String userId,
      String deviceId,
      String deviceOsType,
      String deviceName,
      String deviceManufactur,
      String deviceModel,
      String deviceSDK,
      String deviceProduct,
      String deviceOsVersion,
      String deviceBoard,
      String deviceBrand,
      String deviceDisplay,
      String deviceHardware,
      String deviceHost,
      String deviceType,
      String deviceImei,
      String deviceLat,
      String deviceLong}) async {
    var url = '$baseUrl' + 'add_device.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'userId': userId,
        'deviceId': deviceId,
        'deviceOsType': deviceOsType,
        'deviceName': deviceName,
        'deviceManufactur': deviceManufactur,
        'deviceModel': deviceModel,
        'deviceSDK': deviceSDK,
        'deviceProduct': deviceProduct,
        'deviceOsVersion': deviceOsVersion,
        'deviceBoard': deviceBoard,
        'deviceBrand': deviceBrand,
        'deviceDisplay': deviceDisplay,
        'deviceHardware': deviceHardware,
        'deviceHost': deviceHost,
        'deviceType': deviceType,
        'deviceImei': deviceImei,
        'deviceLat': deviceLat,
        'deviceLong': deviceLong
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      print("insert data berhasil");
      var data = jsonDecode(response.body)['device'];
      DeviceModel dataDevice = DeviceModel.fromJson(data);
      return dataDevice;
    } else {
      throw Exception('gagal insert data device');
    }
  }

  // ignore: missing_return
  Future<DeviceModel> update(
      {String userId,
      String deviceId,
      String deviceLat,
      String deviceLong}) async {
    var url = '$baseUrl' + 'update_device.php';

    var response = await http.post(Uri.parse(url), body: {
      'userId': userId,
      'deviceId': deviceId,
      'deviceLat': deviceLat,
      'deviceLong': deviceLong
    });
    if (response.statusCode == 200) {
      print(response.body);
      print("berhasil");
    }
  }
}
