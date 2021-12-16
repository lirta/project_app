class DeviceModel {
  String userId;
  String deviceId;
  String deviceOsType;
  String deviceName;
  String deviceManufactur;
  String deviceModel;
  String deviceSDK;
  String deviceProduct;
  String deviceOsVersion;
  String deviceBoard;
  String deviceBrand;
  String deviceDisplay;
  String deviceHardware;
  String deviceHost;
  String deviceType;
  String deviceImei;
  String deviceLat;
  String deviceLong;

  DeviceModel(
      {this.userId,
      this.deviceId,
      this.deviceOsType,
      this.deviceName,
      this.deviceManufactur,
      this.deviceModel,
      this.deviceSDK,
      this.deviceProduct,
      this.deviceOsVersion,
      this.deviceBoard,
      this.deviceBrand,
      this.deviceDisplay,
      this.deviceHardware,
      this.deviceHost,
      this.deviceType,
      this.deviceImei,
      this.deviceLat,
      this.deviceLong});

  DeviceModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    deviceId = json['deviceId'];
    deviceOsType = json['deviceOsType'];
    deviceName = json['deviceName'];
    deviceManufactur = json['deviceManufactur'];
    deviceModel = json['deviceModel'];
    deviceSDK = json['deviceSDK'];
    deviceProduct = json['deviceProduct'];
    deviceOsVersion = json['deviceOsVersion'];
    deviceBoard = json['deviceBoard'];
    deviceBrand = json['deviceBrand'];
    deviceDisplay = json['deviceDisplay'];
    deviceHardware = json['deviceHardware'];
    deviceHost = json['deviceHost'];
    deviceType = json['deviceType'];
    deviceImei = json['deviceImei'];
    deviceLat = json['deviceLat'];
    deviceLong = json['deviceLong'];
  }

  Map<String, dynamic> toJson() {
    return {
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
    };
  }
}
