import 'package:flutter/material.dart';

class DialogUtils{

  ///showDialog 方法的使用,但是这个方法有很多东西是固定的
  static void showCommonDialog(BuildContext context,String title,String content){
    showDialog(
        context: context,
        ///  true表示点击弹窗外面就弹窗消失
        barrierDismissible: true,
        builder: (BuildContext context) {
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
              TextButton(child: const Text('确认'), onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },),
            ],
          );
        }
    );
  }

  ///自定义动画,下面这个可以自定义
  static void showGeneralerDialog(BuildContext context,String title,String content){
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
            TextButton(child: const Text('确认'), onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },),
          ],
        );
      },

    );
  }



// Offset fromLeft(Animation animation) {
//   return Offset(animation.value - 1, 0);
// }
//
// Offset fromRight(Animation animation) {
//   return Offset(1 - animation.value, 0);
// }
//
// Offset fromTop(Animation animation) {
//   return Offset(0, animation.value - 1);
// }
//
//
// Offset fromTopLeft(Animation anim) {
//   return fromLeft(anim) + fromTop(anim);
// }

}