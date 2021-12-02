import 'package:flutter/material.dart';
import 'package:myflutterdemo/ui/shared/app_theme.dart';
import 'package:myflutterdemo/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

import 'core/router/router.dart';
import 'core/viewmodel/user_view_model.dart';
import 'myfist/pages/page_guide.dart';
import 'myfist/pages/page_main_1.dart';
import 'myfist/pages/page_splash.dart';

void main() {
  runApp(
    // 全局共享文件
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => ZKUserViewModel())
        ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {

  bool isfirst=true;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 初始化size
    ZKSizeFit.initialize();
    return MaterialApp(
        title: 'Flutter Demo',
        // debug隐藏
        debugShowCheckedModeBanner: false,
        // 主题
        theme: ZKAppTheme.norTheme,
        ///项目一
        // routes: ZKRouter.routes,
        // initialRoute: ZKRouter.initialRoute,
        // onGenerateRoute: ZKRouter.generateRoute,
        // onUnknownRoute: ZKRouter.unknownRoute
      ///项目二
        home: const GuideWidget(),
    );
  }
}