
import 'package:myflutterdemo/core/services/http.dart';
import 'package:myflutterdemo/ui/pages/wxl/model/advertising_model.dart';
import 'package:myflutterdemo/ui/pages/wxl/model/banner_model.dart';
import 'package:myflutterdemo/ui/pages/wxl/model/menu_model.dart';
import 'package:myflutterdemo/ui/pages/wxl/model/quick_model.dart';

class WxlViewModel {
  // 请求横幅数据
  static Future requestBanner() async {

    final data = await HttpRequest.request(
        'user/api/siteVisitingCard/getNextVisitingCard',
        params: {'region': '510116'});
    int code = data['code'];
    if (code != 0) {
      return null;
    }
    List datas = data['datas'];
    if (datas.isEmpty) {
      return null;
    }
    BannerModel bannerModel = BannerModel.fromJson(datas[0]);

    print('00000');
    return bannerModel;
  }

  // 请求快捷菜单
  static Future requestMenus() async {
    final data = await HttpRequest.request('config/api/clientMenu/menuList',
        params: {'location': 'HOME_TOP'});
    int code = data['code'];
    if (code != 0) {
      return null;
    }
    List datas = data['datas'];
    if (datas.isEmpty) {
      return null;
    }
    List<MenuModel> menus = [];
    for (Map data in datas) {
      menus.add(MenuModel.fromJson(data));
    }
    print('1111');
    return menus;
  }

  // 请求广告菜单
  static Future requestdvertising() async {
    final data = await HttpRequest.request('res/api/ad/view',
        params: {'adCode': 'index_top_adv'});
    int code = data['code'];
    if (code != 0) {
      return null;
    }
    Map dic = data['data'];
    List adInfo = dic['adInfo'];
    if (adInfo.isEmpty) {
      return null;
    }
    List<AdvertisingModel> adList = [];
    for (Map mp in adInfo) {
      adList.add(AdvertisingModel.fromJson(mp));
    }
    print('22222');
    return adList;
  }

  // 请求快捷菜单
  static Future requestQuickMenu() async {
    final data = await HttpRequest.request('config/api/indexModule/moduleInfo',
        params: {'location': 'OPERATION'});
    int code = data['code'];
    if (code != 0) {
      return null;
    }
    Map dic = data['data'];
    List resources = dic['resources'];
    if (resources.isEmpty) {
      return null;
    }
    List<QuickModel> list = [];
    for (Map mp in resources) {
      list.add(QuickModel.fromJson(mp));
    }
    print('3333');
    return list;
  }
}
