import 'package:my_first/model/device_model.dart';
import 'package:my_first/services/server.dart';
import 'package:http/http.dart' as http;

class DeviceService {
  Future<DeviceModel> postDevice({
    String androidId,
    String device,
    String deviceId,
    String deviceType,
    String deviceModel,
    String deviceManufactur,
    String deviceVersionSDK,
    String deviceProduct,
    String deviceHost,
  }) async {
    var url = '$baseUrl' + 'device.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'androidId': androidId,
        'device': device,
        'deviceId': deviceId,
        'devdeviceType': deviceType,
        'devdeviceModel': deviceModel,
        'devdeviceManufactur': deviceManufactur,
        'devdeviceVersionSDK': deviceVersionSDK,
        'devdeviceProduct': deviceProduct,
        'devdeviceHost': deviceHost,
      },
    );
    if (response.statusCode == 200) {}
  }
}
