

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutterdemo/base/page_base.dart';
import 'package:myflutterdemo/myfist/widget/banner.dart';
import 'package:myflutterdemo/net/api.dart';
import 'dart:io';

import 'new_model.dart';

class Main1Widget extends StatefulWidget {

  const Main1Widget({Key? key}) : super(key: key);

  @override
  _Main1WidgetState createState() => _Main1WidgetState();


}


class _Main1WidgetState extends BasePage<Main1Widget> {
  static const platform = MethodChannel('com.flutter.guide.CustomView');


  List<String>urls=[
    "https://img1.baidu.com/it/u=3246628741,3439955235&fm=26&fmt=auto",
    "https://t7.baidu.com/it/u=3406125714,2513313326&fm=193&f=GIF",
    "https://img2.baidu.com/it/u=1947582535,1861087167&fm=26&fmt=auto",
    "https://img0.baidu.com/it/u=3031084643,1334557890&fm=26&fmt=auto",
    "https://img0.baidu.com/it/u=1940437512,224113858&fm=26&fmt=auto",
  ];
  double alpha=0;


//api/story/list?listCover=1&tagId=0&pageSize=20&token=7d666c1d41bf45cd920d70b6f8102c1f&source=android&siteCode=site488314
  @override
  void initState() {
    super.initState();
    getBannerDatas();
  }


  //原生Android 交互
  Widget _getAndroidViews(){
    if (Platform.isAndroid) {
      return Container(
        height: 50,
        child: const Center(
          child: AndroidView(
            viewType: 'plugins.flutter.io/custom_platform_view',
            creationParams: {'text': 'Android原生自定义View'},
            ///将 creationParams 编码后再发送给平台侧，它应该与传递给构造函数的编解码器匹配StandardMessageCodec,JSONMessageCodec,StringCodec,BinaryCodec
            creationParamsCodec: StandardMessageCodec(),
          ),
        ),
      );
    }
    return Container();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Stack(
          children: <Widget>[
            NotificationListener(
              onNotification: (scrollNotice){
                if(scrollNotice is ScrollUpdateNotification && scrollNotice.depth==0){
                  _onScroll(scrollNotice.metrics.pixels);
                }
                return false;
              },
              child: ListView(
                children: <Widget>[
                  BannerWidget(urls),

                  _getAndroidViews(),

                  RaisedButton(
                    child: Text('传递参数给原生View'),
                    onPressed: () {
                      platform.invokeMethod('setText', {'name': 'laomeng', 'age': 18});
                    },
                  ),

                  //  Center(
                  //   child: BottomSheetDemo(onChooseCallBack: (String value){
                  //     showToast(value);
                  //   }),
                  // ),
                  Container(
                    height: 800,
                    alignment: Alignment.center,
                    color: Colors.lightBlueAccent,
                    child: const Text("我是底部界面",style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                    ),),
                  ),


                ],

              ),
            ),
            SafeArea(
              child: Opacity(
                opacity: alpha,
                child: Container(
                  color: Colors.white,
                  height: 60,
                  alignment: Alignment.center,
                  child: const Text("我是首页",style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none
                  ),),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }


  void _onScroll(double pixels) {
    alpha=pixels/160;
    if(alpha<=0){
      alpha=0;
    }else if(alpha>1){
      alpha=1;
    }
    setState(() {
    });
  }

  void getBannerDatas() async {
    // var banner =  await  ApiService.getBanner("1","0","1");
    // var jsonDecodee = jsonDecode(banner.toString());
    // var bannerbean = Bannerbean.fromJson(jsonDecodee);
    // var datas = bannerbean.datas;
    // setState(() {
    //   urls.addAll( datas![0].images!);
    // });


    // String value = await rootBundle.loadString('assets/data/banner.json');
    // print("value-----" + value);
    // var decodes = json.decode(value);
    // var bannerbean = Bannerbean.fromJson(decodes);
    // var list = bannerbean.datas![0].images!;
    // print("2222-----" + list.toString());

    //
    // var banner =  await  ApiService.requestOther();
    // print("value-----1111 "+banner.toString() );
    // var newModel = NewModel.fromJson(banner);
    //
    // showToast(newModel.datas![0].name!);
    // var bannerbean = Bannerbean.fromJson(jsonDecodee);
    // var datas = bannerbean.datas;
    // setState(() {
    //   urls.addAll( datas![0].images!);
    // });
  }

}

