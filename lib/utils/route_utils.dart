import 'package:flutter/material.dart';

class RouteUtil {
  ///跳转页面
  static void pushPage(BuildContext context,Widget page){
    if(page == null){
      return;
    }
    Navigator.push(context,
    MaterialPageRoute(builder: (context){
      return page;
    }));
  }


  ///跳转页面并关闭当前界面
  static void pushRePage(BuildContext context,Widget page){
    if(page == null){
      return;
    }
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context){
          return page;
        }));
  }

  ///关闭当前界面
  static void popPage(BuildContext context){
    Navigator.pop(context);
  }
}
