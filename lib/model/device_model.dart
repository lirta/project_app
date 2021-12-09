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

  DeviceModel.fromJson(Map<String, dynamic> json) {
    androidId = json['androidId'];
    device = json['device'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    return {'androidId': androidId, 'device': device, 'deviceId': deviceId};
  }
}
