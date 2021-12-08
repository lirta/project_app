class DeviceModel {
  String androidId;
  String device;
  String deviceId;
  String deviceType;
  String deviceModel;
  String deviceManufactur;
  String deviceVersionSDK;
  String deviceProduct;
  String deviceHost;
  String imei;
  String lat;
  String long;
  String userId;

  DeviceModel(
      {this.androidId,
      this.device,
      this.deviceHost,
      this.deviceId,
      this.deviceManufactur,
      this.deviceModel,
      this.deviceProduct,
      this.deviceType,
      this.deviceVersionSDK,
      this.imei,
      this.lat,
      this.long,
      this.userId});

  DeviceModel.formJson(Map<String, dynamic> json) {
    androidId = json['androidId'];
    device = json['device'];
    deviceId = json['deviceId'];
    deviceType = json['deviceType'];
    deviceModel = json['deviceModel'];
    deviceManufactur = json['deviceManufactur'];
    deviceVersionSDK = json['deviceVersionSDK'];
    deviceProduct = json['deviceProduct'];
    deviceHost = json['deviceHost'];
    imei = json['imei'];
    lat = json['lat'];
    long = json['long'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'androidId': androidId,
      'device': device,
      'devdeviceHost': deviceHost,
      'devdeviceId': deviceId,
      'deviceManufactur': deviceManufactur,
      'devdeviceModel': deviceModel,
      'deviceProduct': deviceProduct,
      'devdeviceType': deviceType,
      'devdeviceVersionSDK': deviceVersionSDK,
      'imei': imei,
      'lat': lat,
      'long': long,
      'userId': userId
    };
  }
}
