// import 'dart:async';
//
// import 'package:flustars/flustars.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:myflutterdemo/base/page_base.dart';
// import 'package:myflutterdemo/myfist/pages/page_main_1.dart';
// import '../util/screen_utils.dart';
//
// class SplashWidget extends StatefulWidget {
//
//   const SplashWidget({Key? key}) : super(key: key);
//
//   @override
//   _SplashWidgetState createState() => _SplashWidgetState();
// }
//
// class _SplashWidgetState extends BasePage<SplashWidget> {
//
//   var mainWidget=const MainWidget();
//
//   bool showAd=true;
//
//   int totleTime=5000;
//
//   // 倒计时控件
//   var mTimerUtil;
//
//   double mCountDownTick = 5;
//
//   //间隔时间
//   int mInterval =100;
//
//   @override
//   void initState() {
//     super.initState();
//     mTimerUtil= TimerUtil(mInterval: mInterval,mTotalTime:  totleTime);
//     mTimerUtil.setOnTimerTickCallback((int tick) {
//       setState(() {
//         mCountDownTick = tick/1000;
//         if(mCountDownTick==0){
//           showAd=false;
//         }
//       });
//
//     });
//     mTimerUtil.startCountDown();
//   }
//
//
//   @override
//   void dispose() {
//     super.dispose();
//     if (mTimerUtil != null){
//       mTimerUtil.cancel();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: <Widget>[
//
//       /// 当offstage 为true   child隐藏
//       Offstage(
//         child: mainWidget,
//         offstage: showAd,
//       ),
//       Offstage(
//         child: Container(
//           color: Colors.white,
//
//           child: Stack(
//             children:  <Widget>[
//               Align(
//                 alignment: const Alignment(0.0,0.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children:  <Widget>[
//                     CircleAvatar(
//                       backgroundImage: const AssetImage("assets/images/home.png"),
//                       backgroundColor: Colors.white,
//                       radius: ScreenUtils.screenW(context)/3,
//                     ),
//                     const Padding(padding: EdgeInsets.only(top: 30)),
//                     const Text(
//                       '落花有意随流水,流水无心恋落花',
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           decoration: TextDecoration.none,
//                           color: Colors.black),
//
//                     ),
//
//                   ],
//                 ),
//               ),
//
//               Positioned(
//                 bottom: 20,
//                 right: 20,
//                 child: SizedBox(
//                   width: 55,
//                   height: 55,
//                   child: Material(
//                     color: Colors.white,
//                     child: InkWell(
//                       onTap: (){
//                         setState(() {
//                           showAd=false;
//                         });
//                         if (mTimerUtil != null){
//                           mTimerUtil.cancel();
//                         }
//                       },
//                       child: Stack(
//                         children: <Widget>  [
//                            Center(
//                             child:  CircularProgressIndicator(
//                               color: Colors.blue,
//                               backgroundColor: Colors.grey[300],
//                               value: (5-mCountDownTick)/5,
//                             ),
//                           ),
//                           Center(
//                             child: Text(
//                               "s",style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.blue,
//                                 decoration: TextDecoration.none
//                             ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SafeArea(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Align(
//                       alignment: const Alignment(1.0,0.0),
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 20,right: 20),
//                         padding: const EdgeInsets.all(8),
//                         child:   CutDownTextView(
//                             onFinishCallBack: (bool value){
//                               if(value){
//                                 setState(() {
//                                   // showAd=false;
//                                 });
//
//                               }
//                             }),
//                         decoration:  const BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: BorderRadius.all(Radius.circular(10) ),
//                         ) ,
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.bottomCenter,
//                       padding: const EdgeInsets.only(bottom: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children:const <Widget> [
//                           Image(image: AssetImage("assets/images/ic_launcher.png"), width: 50),
//                           SizedBox(width: 10),
//                           Text("Hi，豆芽",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
//                               fontSize: 23,
//                               color: Colors.green,
//                               fontWeight: FontWeight.bold,
//                               decoration: TextDecoration.none
//                           ),),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           height: ScreenUtils.screenH(context),
//           width: ScreenUtils.screenW(context),
//         ),
//         offstage: !showAd,
//       )
//
//     ],);
//   }
//
//
// }
//
//
//
//
//
// class CutDownTextView extends StatefulWidget {
//
//   final onFinishCallBack;
//
//   const CutDownTextView({Key? key,required this.onFinishCallBack}) : super(key: key);
//
//
//   @override
//   _CutDownTextViewState createState() => _CutDownTextViewState();
// }
//
//
//
//
// class _CutDownTextViewState extends State<CutDownTextView> {
//
//   int totleTime=5;
//   var timer;
//   @override
//   void initState() {
//     super.initState();
//     CutDowmTime();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     if(timer!=null){
//       print("timer!=null,timer=null  ");
//       timer=null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Text(
//       "$totleTime",
//       textAlign:TextAlign.center,
//       style: const TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//           decoration: TextDecoration.none
//       ),
//     );
//   }
//
//   /// 倒计时
//   void CutDowmTime() {
//     ///方法一
//     timer=Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//       });
//       if (totleTime > 0) {
//         totleTime--;
//       } else {
//         widget.onFinishCallBack(true);
//         timer.cancel();
//       }
//     });
//
//     ///方法二
//     // Future.delayed(const Duration(seconds: 1), () {
//     //   setState(() {
//     //   });
//     //   if (totleTime > 0) {
//     //        totleTime--;
//     //         CutDowmTime();
//     //   } else {
//     //        widget.onFinishCallBack(true);
//     //   }
//     // });
//   }
// }
