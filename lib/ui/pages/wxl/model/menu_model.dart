
/// externalLink : "https://project.daqsoft.com/h5/guide/#/guide-tour"
/// gif : ""
/// id : 128277
/// jumpType : 1
/// location : "HOME_TOP"
/// menuCode : "SCENIC"
/// name : "安逸游"
/// selectIcon : ""
/// subList : []
/// unSelectIcon : "https://file.daqsoft.com/uploadfile/server/wl-cloud/cultural-tourism-cloud/安逸游_1614517235142.png"

class MenuModel {
  MenuModel({
      String? externalLink, 
      String? gif, 
      int? id, 
      int? jumpType, 
      String? location, 
      String? menuCode, 
      String? name, 
      String? selectIcon, 
      List<dynamic>? subList, 
      String? unSelectIcon,}){
    _externalLink = externalLink;
    _gif = gif;
    _id = id;
    _jumpType = jumpType;
    _location = location;
    _menuCode = menuCode;
    _name = name;
    _selectIcon = selectIcon;
    _subList = subList;
    _unSelectIcon = unSelectIcon;
}

  MenuModel.fromJson(dynamic json) {
    _externalLink = json['externalLink'];
    _gif = json['gif'];
    _id = json['id'];
    _jumpType = json['jumpType'];
    _location = json['location'];
    _menuCode = json['menuCode'];
    _name = json['name'];
    _selectIcon = json['selectIcon'];
    _unSelectIcon = json['unSelectIcon'];
  }
  String? _externalLink;
  String? _gif;
  int? _id;
  int? _jumpType;
  String? _location;
  String? _menuCode;
  String? _name;
  String? _selectIcon;
  List<dynamic>? _subList;
  String? _unSelectIcon;

  String? get externalLink => _externalLink;
  String? get gif => _gif;
  int? get id => _id;
  int? get jumpType => _jumpType;
  String? get location => _location;
  String? get menuCode => _menuCode;
  String? get name => _name;
  String? get selectIcon => _selectIcon;
  String? get unSelectIcon => _unSelectIcon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['externalLink'] = _externalLink;
    map['gif'] = _gif;
    map['id'] = _id;
    map['jumpType'] = _jumpType;
    map['location'] = _location;
    map['menuCode'] = _menuCode;
    map['name'] = _name;
    map['selectIcon'] = _selectIcon;
    map['unSelectIcon'] = _unSelectIcon;
    return map;
  }

}