import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:myflutterdemo/base/page_base.dart';
class ZKQqlScreen extends StatefulWidget {
  @override
  State<ZKQqlScreen> createState() => _ZKQqlScreenState();
}

class _ZKQqlScreenState extends BasePage<ZKQqlScreen> {

  static const platform = MethodChannel('com.flutter.guide.CustomView');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _getAndroidViews(),
          TextButton(
            child: Text('传递参数给原生View'),
            onPressed: () {
              platform.invokeMethod('setText', {'name': 'laomeng', 'age': 18});
            },
          ),
          TextButton(
            child: Text(' 跳转到原生View'),
            onPressed: () {
              const demoPlugin = MethodChannel('demo.plugin');
              sendMessageToAndroid(demoPlugin,"111111111111");
            },
          ),
        ],
      ),
    );
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


  void sendMessageToAndroid(MethodChannel demoPlugin, String msg) async{
    var reuslt = await demoPlugin.invokeMethod('send',msg);
    showToast(reuslt);
  }
}
