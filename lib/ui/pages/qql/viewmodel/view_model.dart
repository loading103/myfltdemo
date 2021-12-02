


import 'package:flutter/services.dart';
import 'package:myflutterdemo/core/services/http.dart';
import 'package:myflutterdemo/ui/pages/qql/model/activity_model.dart';
import 'package:myflutterdemo/ui/pages/qql/model/aysc_model.dart';
import 'package:myflutterdemo/ui/pages/qql/model/line_model.dart';
import 'package:myflutterdemo/ui/pages/qql/model/linetag_model.dart';

class QqlViewModel {
  /// 请求热门活动
  static Future getActivityList() async {
    Map<String, String> param = {
      "orderType": "1",
      "pageSize": "3",
      "currPage":"1",
    };

    final responseData  = await HttpRequest.request('res/api/activity/getActivityList',islog:true, params: param);

    int code = responseData['code'];
    if (code != 0) {
      return null;
    }
    List datas = responseData['datas'];
    List<ActivityDatas> activitys = [];
    for (Map data in datas) {
        activitys.add(ActivityDatas.fromJson(data));
    }
    if (activitys.length == 0) {
      return null;
    }
    return activitys;
  }







  /// 请求安逸天府
  static Future getAyScList() async {
    final responseData  = await HttpRequest.request('res/api/content/channelSubset',islog:true,
        params: {'channelCode': 'systemChannel'});
    int code = responseData['code'];
    if (code != 0) {
      return null;
    }
    List datas = responseData['data']['subset'];
    List<AyscModel> beans = [];
    for (Map data in datas) {
      beans.add(AyscModel.fromJson(data));
    }
    if (beans.isEmpty) {
      return null;
    }
    return beans;
  }

  /// 请求精品路线(标题)
  static Future getLineTagList() async {
    final responseData  = await HttpRequest.request('res/api/content/channelContentTagList',islog:true,
        params: {'channelCode': 'lineChannel'});
    int code = responseData['code'];
    if (code != 0) {
      return null;
    }
    List datas = responseData['datas'];
    List<LinTagModel> beans = [];
    for (Map data in datas) {
      beans.add(LinTagModel.fromJson(data));
    }
    if (beans.isEmpty) {
      return null;
    }
    return beans;
  }

  /// 请求精品路线
  static Future getLineList(String tagId) async {
    final responseData  = await HttpRequest.request('res/api/content/list',islog:true,
        params: {'tagId': tagId,'channelCode': 'lineChannel','pageSize': '4','currPage': '1'});
    int code = responseData['code'];
    if (code != 0) {
      return null;
    }
    List datas = responseData['datas'];
    List<LineModel> beans = [];
    for (Map data in datas) {
      beans.add(LineModel.fromJson(data));
    }
    if (beans.isEmpty) {
      return null;
    }
    return beans;
  }
}
