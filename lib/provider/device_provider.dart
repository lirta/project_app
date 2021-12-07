import 'package:flutter/cupertino.dart';
import 'package:my_first/model/device_model.dart';
import 'package:my_first/services/device_service.dart';

class DeviceProvider with ChangeNotifier {
  DeviceModel _dateDevice;
  DeviceModel get dataDevice => _dateDevice;

  set device(DeviceModel dataDevice) {
    _dateDevice = dataDevice;
    notifyListeners();
  }

  Future<bool> postDevice({
      String androidId,
      String device,
      String deviceId,
      String deviceType,
      String deviceModel,
      String deviceManufactur,
      String deviceVersionSDK,
      String deviceProduct,
      String deviceHost, }) async {
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
          deviceHost: deviceHost);
      _dateDevice = dataDevice;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
