
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myflutterdemo/utils/route_utils.dart';

abstract class BasePage<T extends StatefulWidget> extends State<T>{


  ///跳转页面
  void pushPage(Widget page){
    RouteUtil.pushPage(context, page);
  }

  ///跳转页面并关闭当前界面
  void pushRePage(Widget page){
    RouteUtil.pushRePage(context, page);
  }

  ///关闭当前界面
  void popPage(){
    Navigator.pop(context);
  }

  ///提示消息
  void showToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightBlueAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  ///普通dialog弹窗

  void showCommonDialog(String  title, String content,VoidCallback callback) async {
    showGeneralDialog(
      context: context,
      ///  true表示点击弹窗外面就弹窗消失
      transitionDuration: const Duration(milliseconds: 200),
      ///下面两个需要在一起使用后
      barrierLabel: "你好",
      barrierDismissible: true,
      transitionBuilder:(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
        ///移动效果
        // return FractionalTranslation(
        //   ///Offset(0, 1 - animation.value) 从下到上
        //   ///Offset(0, animation.value - 1) 从下到上
        //   ///Offset(animation.value - 1, 0) 从左到右
        //   ///Offset(1-animation.value , 0) 从右到左
        //   translation:    Offset(animation.value - 1, 0)+Offset(0, 1 - animation.value),
        //   child: child,
        // );

        ///缩放效果
        return ScaleTransition(
          alignment: Alignment.bottomCenter, // 添加这个
          scale: animation,
          child: child,
        );

      } ,
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          backgroundColor: Colors.white,
          elevation: 24,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          actions: <Widget>[
            TextButton(
              child: const Text('取消', style: TextStyle(color: Colors.grey),),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },),
            TextButton(child: const Text('确认'), onPressed: (){
              Navigator.of(context, rootNavigator: true).pop();
              callback.call();
            }),
          ],
        );
      },

    );
  }



  ///仿ios弹窗  需要设置全局GlobalCupertinoLocalizations
  ///showCupertinoDialog和CupertinoAlertDialog配合使用展示iOS风格对话框，showCupertinoDialog点击空白处是无法退出对话框的
  void showIosDialog(String  title, String content,VoidCallback callback){
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title:  Text(title),
            content: Text(content),
            actions: <Widget>[
              CupertinoDialogAction(child: const Text('取消'),onPressed: (){
                showToast('取消');
                Navigator.of(context, rootNavigator: true).pop();
              },),
              CupertinoDialogAction(child: const Text('确认'),onPressed: (){
                showToast('确认');
                Navigator.of(context, rootNavigator: true).pop();
                callback.call();
              },),
            ],
          );
        });
  }


  void  showLoading(){
    EasyLoading.show(status: '加载中...');
    // EasyLoading.show();
  }

  void dissmissLoading(){
    EasyLoading.dismiss();
  }
}