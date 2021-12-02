import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ZKWxlScreen extends StatelessWidget {

  static const platform = const MethodChannel('smples.flutter.dev/goToNativePage');

  Future<void> _goToNativePage() async {
    try{
      final int result = await platform.invokeMethod('goToNativePage',{'test':'form flutter'});
      print(result);
    } on PlatformException catch(e){}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('嵌入原生view',style: TextStyle(fontSize: 20)),
          Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              padding: EdgeInsets.all(10),
              height: 200,
              color: Colors.blue,
              child: UiKitView(
                viewType: 'MyFlutterView',
                creationParams: {'text':'ios','age':'18'},
                creationParamsCodec: StandardMessageCodec(),
                onPlatformViewCreated: (viewID){
                  print('viewID:$viewID');
                },
              )
          ),
          Text('跳转原生view',style: TextStyle(fontSize: 20)),
          RaisedButton(child: Text('点击跳转'),onPressed: _goToNativePage,color: Colors.blueAccent,textColor: Colors.white)
        ],
      ),
    );
  }
}

