import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutterdemo/base/page_base.dart';
import 'package:myflutterdemo/myfist/pages/web/page_web.dart';
import 'package:myflutterdemo/myfist/widget/bottomesheet.dart';

class Main3Widget extends StatefulWidget {

  const Main3Widget({Key? key}) : super(key: key);

  @override
  _Main3WidgetState createState() => _Main3WidgetState();


}

class _Main3WidgetState extends BasePage<Main3Widget> {

  List<String>datas=[
    "底部弹窗",
    "仿ios弹窗",
    "自定义弹窗",
    "loading",
    "WebView",
    "Android原生交互"
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("常用控件",style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),),
      ),

      body:ListView.builder(
          itemCount: datas.length,
          itemBuilder: (BuildContext context, int index){
            return  itemBuilder(index);

          }),
    );
  }


  /// 构建item
  Widget itemBuilder(int index) {
    if(index==0){
      return BottomSheetDemo(
          title: datas[0],
          onChooseCallBack: (String value){showToast(value);}
      );
    }else{
      return InkWell(
        splashColor: Colors.blueGrey,
        onTap: (){onItemClick(index);},
        child:  Container(
          // padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15,),
                Text(datas[index],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),),
                const SizedBox(height: 15,),
                const Divider(height: 1, color: Colors.grey)
              ],
            ),
          ),
        ),
      );
    }
  }


  ///item点击事件
  void onItemClick(int index) {
    switch(datas[index]){
      case "仿ios弹窗":
        showIosDialog("温馨提示", '确认删除吗？',(){
          showToast("点击了确定");
        });
        break;
      case "自定义弹窗":
        showCommonDialog("温馨提示", '确认删除吗？',(){
          showToast("点击了确定");
        });
        break;
      case "loading":
        showLoading();
        Future.delayed(const Duration(seconds: 3),(){
          showToast("点击了确定");
          dissmissLoading();
        });
        break;
      case "WebView":
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          return  WebWidget( "我是webView", "http://site488314.c-ctc.test.daqsoft.com/#/volunteer-index");
        }));
        break;
      case "Android原生交互":
        const demoPlugin = MethodChannel('demo.plugin');
        sendMessageToAndroid(demoPlugin,"111111111111");

        break;
    }
  }

  void sendMessageToAndroid(MethodChannel demoPlugin, String msg) async{
    var reuslt = await demoPlugin.invokeMethod('send',msg);
    showToast(reuslt);
  }

}
