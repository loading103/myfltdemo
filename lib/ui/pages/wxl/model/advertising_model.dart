
/// adId : 78
/// imgUrl : "https://file.daqsoft.com/uploadfile/server/wl-cloud/cultural-tourism-cloud/微信截图_20211114224505.png"
/// jumpUrl : "https://zhgl.tsichuan.com/code-h5/"
/// resourceId : null
/// resourceType : "OUTSIDE"
/// type : "OUTSIDE"

class AdvertisingModel {
  AdvertisingModel({
      int? adId, 
      String? imgUrl, 
      String? jumpUrl, 
      dynamic resourceId, 
      String? resourceType, 
      String? type,}){
    _adId = adId;
    _imgUrl = imgUrl;
    _jumpUrl = jumpUrl;
    _resourceId = resourceId;
    _resourceType = resourceType;
    _type = type;
}

  AdvertisingModel.fromJson(dynamic json) {
    _adId = json['adId'];
    _imgUrl = json['imgUrl'];
    _jumpUrl = json['jumpUrl'];
    _resourceId = json['resourceId'];
    _resourceType = json['resourceType'];
    _type = json['type'];
  }
  int? _adId;
  String? _imgUrl;
  String? _jumpUrl;
  dynamic _resourceId;
  String? _resourceType;
  String? _type;

  int? get adId => _adId;
  String? get imgUrl => _imgUrl;
  String? get jumpUrl => _jumpUrl;
  dynamic get resourceId => _resourceId;
  String? get resourceType => _resourceType;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adId'] = _adId;
    map['imgUrl'] = _imgUrl;
    map['jumpUrl'] = _jumpUrl;
    map['resourceId'] = _resourceId;
    map['resourceType'] = _resourceType;
    map['type'] = _type;
    return map;
  }

}