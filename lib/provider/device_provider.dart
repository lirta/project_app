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
      {String deviceId,
      String userId,
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
    try {
      DeviceModel dataDevice = await DeviceService().postDevice(
        deviceId: deviceId,
        userId: userId,
        deviceOsType: deviceOsType,
        deviceName: deviceName,
        deviceManufactur: deviceManufactur,
        deviceModel: deviceModel,
        deviceSDK: deviceSDK,
        deviceProduct: deviceProduct,
        deviceOsVersion: deviceOsVersion,
        deviceBoard: deviceBoard,
        deviceBrand: deviceBrand,
        deviceDisplay: deviceDisplay,
        deviceHardware: deviceHardware,
        deviceHost: deviceHost,
        deviceType: deviceType,
        deviceImei: deviceImei,
        deviceLat: deviceLat,
        deviceLong: deviceLong,
      );
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
