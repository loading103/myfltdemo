// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:myfltdemo/common/colors.dart';
// import 'package:myfltdemo/pages/page_guide.dart';
// import 'package:myfltdemo/pages/page_main_1.dart';
// import 'package:myfltdemo/util/shared_preferences_utils.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'common/common.dart';
// import 'pages/page_splash.dart';
// import 'dart:io';
//
// import 'util/custom_animation.dart';
// void main() {
//
//   runApp( MyApp());
//   configLoading();
//   if (Platform.isAndroid) {
//     //   //设置Android头部的导航栏透明
//     SystemUiOverlayStyle systemUiOverlayStyle =
//     const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark);
//     SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//   }
// }
//
// void configLoading() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 2000)
//     ..indicatorType = EasyLoadingIndicatorType.fadingCircle
//     ..loadingStyle = EasyLoadingStyle.custom
//     ..indicatorSize = 45.0
//     ..radius = 10.0
//     ..progressColor = Colors.white
//     ..backgroundColor = Colors.grey[400]
//     ..indicatorColor = Colors.white
//     ..textColor = Colors.white
//     ..maskColor = Colors.blue.withOpacity(0.5)
//     ..userInteractions = true
//     ..dismissOnTap = false
//     ..customAnimation = CustomAnimation();
// }
//
//
//
// class MyApp extends StatefulWidget {
//
//   MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   var isfirst =true;
//
//   @override
//   void initState() {
//     super.initState();
//     SharedPreferencesUtils.getPreference(context, BaseConstant.SAVE_FIRST_IN, true).then((value) {
//       if(value!=null){
//         isfirst=value;
//       }
//       setState(() {
//
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       builder: EasyLoading.init(),
//       home:  isfirst?  const GuideWidget(): const SplashWidget(),
//
//       ///Flutter 只提供美式英语的本地化。如果想要添加其他语言，你的应用必须指定额外的 MaterialApp 属性并且添加一个单独的 package，叫做 flutter_localizations
//       localizationsDelegates: const [
//         /// 初始化Material组件本地化
//         GlobalMaterialLocalizations.delegate,
//         /// 初始化Widget组件本地化
//         GlobalWidgetsLocalizations.delegate,
//         /// 初始化下拉刷新本地组件本地化
//         RefreshLocalizations.delegate,
//
//         GlobalCupertinoLocalizations.delegate
//       ],
//       ///自定义当前所在地
//       locale: const Locale("zh","CN"),
//       /// 自定义当前支持那些语言
//       supportedLocales: const [
//         Locale("en","US"),
//         Locale("he","IL"),
//         Locale("zh","CN"),
//       ],
//     );
//   }
// }
