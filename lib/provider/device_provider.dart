import 'package:flutter/cupertino.dart';
import 'package:my_first/model/device_model.dart';
import 'package:my_first/services/device_service.dart';

class DeviceProvider with ChangeNotifier {
  List<DeviceModel> _device = [];
  List<DeviceModel> get device => _device;

  set device(List<DeviceModel> device) {
    _device = device;
    notifyListeners();
  }

  Future<void> postDevice(
      String androidId,
      String device,
      String deviceId,
      String deviceType,
      String deviceModel,
      String deviceManufactur,
      String deviceVersionSDK,
      String deviceProduct,
      String deviceHost) async {
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
    } catch (e) {}
  }
}
