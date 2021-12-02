import 'package:flutter/cupertino.dart';
import 'package:myflutterdemo/ui/pages/main.dart';

class ZKRouter {
  static final String initialRoute = ZKMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    ZKMainScreen.routeName: (ctx) => ZKMainScreen(),
  };

  // 路由拦截
  static final RouteFactory generateRoute = (settings) {
//    if (settings.name == pathPage3) {
//      return MaterialPageRoute(
//          builder: (ctx) {
//            return Page3(settings.arguments);
//          }
//      );
//    }
    return null;
  };
  // 路由异常
  static final RouteFactory unknownRoute = (settings) {
//    return MaterialPageRoute(
//        builder: (ctx) {
//          return WGUnknownPage();
//        }
//    );
    return null;
  };

}