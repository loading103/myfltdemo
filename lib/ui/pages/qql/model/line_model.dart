class LineModel {
  LineModel({
      this.audio, 
      this.author, 
      this.channelName, 
      this.commentNum, 
      this.contentSource, 
      this.contentType, 
      this.createCompany, 
      this.createCompanyLogo, 
      this.id, 
      this.imageUrls, 
      this.likeNum, 
      this.publishTime, 
      this.recommendChannelHomePage, 
      this.recommendHomePage, 
      this.showNum, 
      this.sort, 
      this.source, 
      this.sourceUrl, 
      this.status, 
      this.summary, 
      this.tagName, 
      this.title, 
      this.top, 
      this.video,});

  LineModel.fromJson(dynamic json) {
    if (json['audio'] != null) {
      audio = [];
      json['audio'].forEach((v) {
        audio?.add(v);
      });
    }
    author = json['author'];
    channelName = json['channelName'];
    commentNum = json['commentNum'];
    contentSource = json['contentSource'];
    contentType = json['contentType'];
    createCompany = json['createCompany'];
    createCompanyLogo = json['createCompanyLogo'];
    id = json['id'];
    if (json['imageUrls'] != null) {
      imageUrls = [];
      json['imageUrls'].forEach((v) {
        imageUrls?.add(ImageUrls.fromJson(v));
      });
    }
    likeNum = json['likeNum'];
    publishTime = json['publishTime'];
    recommendChannelHomePage = json['recommendChannelHomePage'];
    recommendHomePage = json['recommendHomePage'];
    showNum = json['showNum'];
    sort = json['sort'];
    source = json['source'];
    sourceUrl = json['sourceUrl'];
    status = json['status'];
    summary = json['summary'];
    tagName = json['tagName'] != null ? json['tagName'].cast<String>() : [];
    title = json['title'];
    top = json['top'];
    video = json['video'];
  }
  List<dynamic>? audio;
  String? author;
  String? channelName;
  int? commentNum;
  String? contentSource;
  String? contentType;
  String? createCompany;
  String? createCompanyLogo;
  int? id;
  List<ImageUrls>? imageUrls;
  int? likeNum;
  String? publishTime;
  int? recommendChannelHomePage;
  int? recommendHomePage;
  int? showNum;
  int? sort;
  String? source;
  String? sourceUrl;
  int? status;
  String? summary;
  List<String>? tagName;
  String? title;
  int? top;
  dynamic video;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (audio != null) {
      map['audio'] = audio?.map((v) => v.toJson()).toList();
    }
    map['author'] = author;
    map['channelName'] = channelName;
    map['commentNum'] = commentNum;
    map['contentSource'] = contentSource;
    map['contentType'] = contentType;
    map['createCompany'] = createCompany;
    map['createCompanyLogo'] = createCompanyLogo;
    map['id'] = id;
    if (imageUrls != null) {
      map['imageUrls'] = imageUrls?.map((v) => v.toJson()).toList();
    }
    map['likeNum'] = likeNum;
    map['publishTime'] = publishTime;
    map['recommendChannelHomePage'] = recommendChannelHomePage;
    map['recommendHomePage'] = recommendHomePage;
    map['showNum'] = showNum;
    map['sort'] = sort;
    map['source'] = source;
    map['sourceUrl'] = sourceUrl;
    map['status'] = status;
    map['summary'] = summary;
    map['tagName'] = tagName;
    map['title'] = title;
    map['top'] = top;
    map['video'] = video;
    return map;
  }

}

class ImageUrls {
  ImageUrls({
      this.address, 
      this.description, 
      this.imgUrl, 
      this.latitude, 
      this.longitude, 
      this.name, 
      this.resourceId, 
      this.resourceName, 
      this.resourceType, 
      this.tagIds, 
      this.tagNames, 
      this.url,});

  ImageUrls.fromJson(dynamic json) {
    address = json['address'];
    description = json['description'];
    imgUrl = json['imgUrl'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    resourceId = json['resourceId'];
    resourceName = json['resourceName'];
    resourceType = json['resourceType'];
    tagIds = json['tagIds'];
    if (json['tagNames'] != null) {
      tagNames = [];
      json['tagNames'].forEach((v) {
        tagNames?.add(v);
      });
    }
    url = json['url'];
  }
  String? address;
  String? description;
  String? imgUrl;
  String? latitude;
  String? longitude;
  String? name;
  dynamic resourceId;
  String? resourceName;
  String? resourceType;
  String? tagIds;
  List<String>? tagNames;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['description'] = description;
    map['imgUrl'] = imgUrl;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['name'] = name;
    map['resourceId'] = resourceId;
    map['resourceName'] = resourceName;
    map['resourceType'] = resourceType;
    map['tagIds'] = tagIds;
    map['url'] = url;
    return map;
  }

}