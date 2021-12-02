class LinTagModel {
  LinTagModel({
      this.tagId, 
      this.tagName,});

  LinTagModel.fromJson(dynamic json) {
    tagId = json['tagId'];
    tagName = json['tagName'];
  }
  int? tagId;
  String? tagName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tagId'] = tagId;
    map['tagName'] = tagName;
    return map;
  }

}