import 'httpmaneger.dart';
import 'path.dart';

/// 所有接口类
class ApiService{
  ///示例请求
  static getBanner(String listCover,String tagId,String pageSize) {
    Map<String, String> param = {
      "listCover": listCover,
      "tagId": tagId,
      "pageSize":pageSize,
    };
    return HttpUtils. getInstance().get(UrlPath.BANNER_PATH, data: param);
  }

  static requestOther() {
    Map<String, String> param = {
      "orderType": "1",
      "pageSize": "3",
      "currPage":"1",
    };
    return  HttpUtils. getBaseUrlInstance(baseUrl: "https://zytf.dsichuan.com/api/").get('res/api/activity/getActivityList',data: param);

  }

}
