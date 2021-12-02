class AyscModel {
  AyscModel({
      this.backgroundImg, 
      this.channelCode, 
      this.channelType, 
      this.content, 
      this.createTime, 
      this.createUser, 
      this.english, 
      this.folder, 
      this.hideSite, 
      this.id, 
      this.logo, 
      this.name, 
      this.pid, 
      this.showChannel, 
      this.siteId, 
      this.sort, 
      this.status, 
      this.summary, 
      this.updateTime, 
      this.updateUser, 
      this.url,});

  AyscModel.fromJson(dynamic json) {
    backgroundImg = json['backgroundImg'];
    channelCode = json['channelCode'];
    channelType = json['channelType'];
    content = json['content'];
    createTime = json['createTime'];
    createUser = json['createUser'];
    english = json['english'];
    folder = json['folder'];
    hideSite = json['hideSite'];
    id = json['id'];
    logo = json['logo'];
    name = json['name'];
    pid = json['pid'];
    showChannel = json['showChannel'];
    siteId = json['siteId'];
    sort = json['sort'];
    status = json['status'];
    summary = json['summary'];
    updateTime = json['updateTime'];
    updateUser = json['updateUser'];
    url = json['url'];
  }
  String? backgroundImg;
  String? channelCode;
  int? channelType;
  String? content;
  String? createTime;
  int? createUser;
  String? english;
  int? folder;
  String? hideSite;
  int? id;
  String? logo;
  String? name;
  int? pid;
  bool? showChannel;
  int? siteId;
  int? sort;
  int? status;
  String? summary;
  String? updateTime;
  int? updateUser;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backgroundImg'] = backgroundImg;
    map['channelCode'] = channelCode;
    map['channelType'] = channelType;
    map['content'] = content;
    map['createTime'] = createTime;
    map['createUser'] = createUser;
    map['english'] = english;
    map['folder'] = folder;
    map['hideSite'] = hideSite;
    map['id'] = id;
    map['logo'] = logo;
    map['name'] = name;
    map['pid'] = pid;
    map['showChannel'] = showChannel;
    map['siteId'] = siteId;
    map['sort'] = sort;
    map['status'] = status;
    map['summary'] = summary;
    map['updateTime'] = updateTime;
    map['updateUser'] = updateUser;
    map['url'] = url;
    return map;
  }

}