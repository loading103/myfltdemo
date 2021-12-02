class ActivityModel {

  int? code;
  List<ActivityDatas>? datas;
  String? message;
  Page? page;
  int? responseTime;

  ActivityModel({
      this.code, 
      this.datas, 
      this.message, 
      this.page, 
      this.responseTime,});

  ActivityModel.fromJson(dynamic json) {
    code = json['code'];
    if (json['datas'] != null) {
      datas = [];
      json['datas'].forEach((v) {
        datas?.add(ActivityDatas.fromJson(v));
      });
    }
    message = json['message'];
    page = json['page'] != null ? Page.fromJson(json['page']) : null;
    responseTime = json['responseTime'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (datas != null) {
      map['datas'] = datas?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    if (page != null) {
      map['page'] = page?.toJson();
    }
    map['responseTime'] = responseTime;
    return map;
  }




}

class Page {
  Page({
      this.currPage, 
      this.pageSize, 
      this.total, 
      this.totalPage,});

  Page.fromJson(dynamic json) {
    currPage = json['currPage'];
    pageSize = json['pageSize'];
    total = json['total'];
    totalPage = json['totalPage'];
  }
  int? currPage;
  int? pageSize;
  int? total;
  int? totalPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currPage'] = currPage;
    map['pageSize'] = pageSize;
    map['total'] = total;
    map['totalPage'] = totalPage;
    return map;
  }

}

class ActivityDatas {
  ActivityDatas({
      this.activityStatus, 
      this.activityStatusDays, 
      this.address, 
      this.cityRegionNames,
      this.classifyId,
      this.classifyName,
      this.coverImage,
      this.createTime,
      this.faithAuditStatus,
      this.faithAuditValue,
      this.faithUseStatus,
      this.faithUseValue,
      this.id,
      this.images,
      this.integral,
      this.jumpName,
      this.jumpType,
      this.jumpUrl,
      this.latitude,
      this.lineFlag,
      this.liveUrl,
      this.longitude,
      this.method,
      this.money,
      this.name,
      this.orgId,
      this.phone,
      this.recommendChannelHomePage,
      this.recommendHomePage,
      this.recruitedCount,
      this.region,
      this.regionName,
      this.regionNameStr,
      this.remark,
      this.resourceCount,
      this.resourceId,
      this.resourceNameStr,
      this.signEndTime,
      this.signStartTime,
      this.siteId,
      this.sort,
      this.status,
      this.stock,
      this.subhead,
      this.tag,
      this.tagNames,
      this.teachUnit,
      this.teamId,
      this.top,
      this.totalStock,
      this.type,
      this.useEndTime,
      this.useStartTime,
      this.userHead,
      this.userLevel,
      this.userName,
      this.userResourceStatus,
  });

  ActivityDatas.fromJson(dynamic json) {
    activityStatus = json['activityStatus'];
    activityStatusDays = json['activityStatusDays'];
    address = json['address'];
    cityRegionNames = json['cityRegionNames'];
    classifyId = json['classifyId'];
    classifyName = json['classifyName'];
    coverImage = json['coverImage'];
    createTime = json['createTime'];
    faithAuditStatus = json['faithAuditStatus'];
    faithAuditValue = json['faithAuditValue'];
    faithUseStatus = json['faithUseStatus'];
    faithUseValue = json['faithUseValue'];
    id = json['id'];
    images = json['images'];
    integral = json['integral'];
    jumpName = json['jumpName'];
    jumpType = json['jumpType'];
    jumpUrl = json['jumpUrl'];
    latitude = json['latitude'];
    lineFlag = json['lineFlag'];
    liveUrl = json['liveUrl'];
    longitude = json['longitude'];
    method = json['method'];
    money = json['money'];
    name = json['name'];
    orgId = json['orgId'];
    phone = json['phone'];
    recommendChannelHomePage = json['recommendChannelHomePage'];
    recommendHomePage = json['recommendHomePage'];
    recruitedCount = json['recruitedCount'];
    region = json['region'];
    regionName = json['regionName'];
    regionNameStr = json['regionNameStr'];
    remark = json['remark'];
    resourceCount = json['resourceCount'];
    resourceId = json['resourceId'];
    resourceNameStr = json['resourceNameStr'];
    signEndTime = json['signEndTime'];
    signStartTime = json['signStartTime'];
    siteId = json['siteId'];
    sort = json['sort'];
    status = json['status'];
    stock = json['stock'];
    subhead = json['subhead'];
    tag = json['tag'];
    tagNames = json['tagNames'];
    teachUnit = json['teachUnit'];
    teamId = json['teamId'];
    top = json['top'];
    totalStock = json['totalStock'];
    type = json['type'];
    useEndTime = json['useEndTime'];
    useStartTime = json['useStartTime'];
    userHead = json['userHead'];
    userLevel = json['userLevel'];
    userName = json['userName'];
    userResourceStatus = json['userResourceStatus'] != null ? UserResourceStatus.fromJson(json['userResourceStatus']) : null;
  }
  int? activityStatus;
  int? activityStatusDays;
  String? address;
  String? cityRegionNames;
  dynamic classifyId;
  String? classifyName;
  String? coverImage;
  String? createTime;
  int? faithAuditStatus;
  int? faithAuditValue;
  int? faithUseStatus;
  int? faithUseValue;
  int? id;
  String? images;
  int? integral;
  String? jumpName;
  String? jumpType;
  String? jumpUrl;
  String? latitude;
  int? lineFlag;
  String? liveUrl;
  String? longitude;
  String? method;
  double? money;
  String? name;
  dynamic orgId;
  String? phone;
  int? recommendChannelHomePage;
  int? recommendHomePage;
  dynamic recruitedCount;
  String? region;
  String? regionName;
  String? regionNameStr;
  String? remark;
  int? resourceCount;
  int? resourceId;
  String? resourceNameStr;
  dynamic signEndTime;
  dynamic signStartTime;
  int? siteId;
  dynamic sort;
  int? status;
  int? stock;
  String? subhead;
  String? tag;
  String? tagNames;
  String? teachUnit;
  dynamic teamId;
  int? top;
  int? totalStock;
  String? type;
  String? useEndTime;
  String? useStartTime;
  String? userHead;
  dynamic userLevel;
  String? userName;
  UserResourceStatus? userResourceStatus;

  String? getOpenTime(){
    return  useStartTime!.substring(5,10).replaceAll("-", ".")+"-"+useEndTime!.substring(5,10).replaceAll("-", ".");
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activityStatus'] = activityStatus;
    map['activityStatusDays'] = activityStatusDays;
    map['address'] = address;
    map['cityRegionNames'] = cityRegionNames;
    map['classifyId'] = classifyId;
    map['classifyName'] = classifyName;
    map['coverImage'] = coverImage;
    map['createTime'] = createTime;
    map['faithAuditStatus'] = faithAuditStatus;
    map['faithAuditValue'] = faithAuditValue;
    map['faithUseStatus'] = faithUseStatus;
    map['faithUseValue'] = faithUseValue;
    map['id'] = id;
    map['images'] = images;
    map['integral'] = integral;
    map['jumpName'] = jumpName;
    map['jumpType'] = jumpType;
    map['jumpUrl'] = jumpUrl;
    map['latitude'] = latitude;
    map['lineFlag'] = lineFlag;
    map['liveUrl'] = liveUrl;
    map['longitude'] = longitude;
    map['method'] = method;
    map['money'] = money;
    map['name'] = name;
    map['orgId'] = orgId;
    map['phone'] = phone;
    map['recommendChannelHomePage'] = recommendChannelHomePage;
    map['recommendHomePage'] = recommendHomePage;
    map['recruitedCount'] = recruitedCount;
    map['region'] = region;
    map['regionName'] = regionName;
    map['regionNameStr'] = regionNameStr;
    map['remark'] = remark;
    map['resourceCount'] = resourceCount;
    map['resourceId'] = resourceId;
    map['resourceNameStr'] = resourceNameStr;
    map['signEndTime'] = signEndTime;
    map['signStartTime'] = signStartTime;
    map['siteId'] = siteId;
    map['sort'] = sort;
    map['status'] = status;
    map['stock'] = stock;
    map['subhead'] = subhead;
    map['tag'] = tag;
    map['tagNames'] = tagNames;
    map['teachUnit'] = teachUnit;
    map['teamId'] = teamId;
    map['top'] = top;
    map['totalStock'] = totalStock;
    map['type'] = type;
    map['useEndTime'] = useEndTime;
    map['useStartTime'] = useStartTime;
    map['userHead'] = userHead;
    map['userLevel'] = userLevel;
    map['userName'] = userName;
    if (userResourceStatus != null) {
      map['userResourceStatus'] = userResourceStatus?.toJson();
    }
    return map;
  }

}

class UserResourceStatus {
  UserResourceStatus({
      this.thumbStatus, 
      this.resourceFansStatus, 
      this.collectionStatus,});

  UserResourceStatus.fromJson(dynamic json) {
    thumbStatus = json['thumbStatus'];
    resourceFansStatus = json['resourceFansStatus'];
    collectionStatus = json['collectionStatus'];
  }
  bool? thumbStatus;
  bool? resourceFansStatus;
  bool? collectionStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumbStatus'] = thumbStatus;
    map['resourceFansStatus'] = resourceFansStatus;
    map['collectionStatus'] = collectionStatus;
    return map;
  }

}