import 'package:flutter/cupertino.dart';
import 'package:my_first/model/device_model.dart';
import 'package:my_first/services/device_service.dart';

class DeviceProvider with ChangeNotifier {
  DeviceModel _dataDevice;
  DeviceModel get dataDevice => _dataDevice;

  set dataDevice(DeviceModel dataDevice) {
    _dataDevice = dataDevice;
    notifyListeners();
  }

  Future<bool> postDevice(
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
      String long,
      String userId}) async {
    try {
      DeviceModel dataDevice = await DeviceService().postDevice(
          androidId: androidId,
          device: device,
          deviceId: deviceId,
          deviceType: deviceType,
          deviceModel: deviceModel,
          deviceManufactur: deviceManufactur,
          deviceVersionSDK: deviceVersionSDK,
          deviceProduct: deviceProduct,
          deviceHost: deviceHost,
          imei: imei,
          lat: lat,
          long: long,
          userId: userId);
      _dataDevice = dataDevice;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateDevice(
      {String userId, String deviceId, String lat, String long}) async {
    try {
      DeviceModel dataDevice = await DeviceService()
          .update(userId: userId, deviceId: deviceId, lat: lat, long: long);
      _dataDevice = dataDevice;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
