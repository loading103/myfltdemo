
class QuickModel {
  QuickModel({
      String? createTime, 
      String? externalLink, 
      int? id, 
      String? imgUrl, 
      int? jumpType, 
      String? location, 
      String? menuCode, 
      int? moduleId, 
      String? resourceName, 
      String? resourceType, 
      String? resourceValue,}){
    _createTime = createTime;
    _externalLink = externalLink;
    _id = id;
    _imgUrl = imgUrl;
    _jumpType = jumpType;
    _location = location;
    _menuCode = menuCode;
    _moduleId = moduleId;
    _resourceName = resourceName;
    _resourceType = resourceType;
    _resourceValue = resourceValue;
}

  QuickModel.fromJson(dynamic json) {
    _createTime = json['createTime'];
    _externalLink = json['externalLink'];
    _id = json['id'];
    _imgUrl = json['imgUrl'];
    _jumpType = json['jumpType'];
    _location = json['location'];
    _menuCode = json['menuCode'];
    _moduleId = json['moduleId'];
    _resourceName = json['resourceName'];
    _resourceType = json['resourceType'];
    _resourceValue = json['resourceValue'];
  }
  String? _createTime;
  String? _externalLink;
  int? _id;
  String? _imgUrl;
  int? _jumpType;
  String? _location;
  String? _menuCode;
  int? _moduleId;
  String? _resourceName;
  String? _resourceType;
  String? _resourceValue;

  String? get createTime => _createTime;
  String? get externalLink => _externalLink;
  int? get id => _id;
  String? get imgUrl => _imgUrl;
  int? get jumpType => _jumpType;
  String? get location => _location;
  String? get menuCode => _menuCode;
  int? get moduleId => _moduleId;
  String? get resourceName => _resourceName;
  String? get resourceType => _resourceType;
  String? get resourceValue => _resourceValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createTime'] = _createTime;
    map['externalLink'] = _externalLink;
    map['id'] = _id;
    map['imgUrl'] = _imgUrl;
    map['jumpType'] = _jumpType;
    map['location'] = _location;
    map['menuCode'] = _menuCode;
    map['moduleId'] = _moduleId;
    map['resourceName'] = _resourceName;
    map['resourceType'] = _resourceType;
    map['resourceValue'] = _resourceValue;
    return map;
  }

}