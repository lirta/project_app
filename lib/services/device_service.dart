// import 'dart:convert';

import 'package:my_first/model/device_model.dart';
import 'package:my_first/services/server.dart';
import 'package:http/http.dart' as http;

class DeviceService {
  // ignore: missing_return
  Future<DeviceModel> postDevice(
      {String androidId,
      String device,
      String deviceId,
      String deviceType,
      String deviceModel,
      String deviceManufactur,
      String deviceVersionSDK,
      String deviceProduct,
      String deviceHost,
      String imei,
      String lat,
      String long}) async {
    var url = '$baseUrl' + 'add_device.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'androidId': androidId,
        'device': device,
        'deviceId': deviceId,
        'deviceType': deviceType,
        'deviceModel': deviceModel,
        'deviceManufactur': deviceManufactur,
        'deviceVersionSDK': deviceVersionSDK,
        'deviceProduct': deviceProduct,
        'deviceHost': deviceHost,
        'imei': imei,
        'lat': lat,
        'long': long
      },
    );
    if (response.statusCode == 200) {
      print("insert data berhasil");
      // var data = jsonDecode(response.body)['device'];
      // DeviceModel dataDevice = DeviceModel.formJson(data);

      // return dataDevice;
    } else {
      throw Exception('gagal insert data device');
    }
  }
}
