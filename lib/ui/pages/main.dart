import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflutterdemo/ui/pages/qql/qql.dart';
import 'package:myflutterdemo/ui/pages/wxl/wxl.dart';

import 'home/home.dart';

class ZKMainScreen extends StatefulWidget {
  static const String routeName = "/";
  @override
  _ZKMainScreenState createState() => _ZKMainScreenState();
}

class _ZKMainScreenState extends State<ZKMainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {


    //设置尺寸（填写设计中设备的屏幕尺寸）如果设计基于360dp * 690dp的屏幕
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 667),
        orientation: Orientation.portrait);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ZKHomeScreen(),
          ZKQqlScreen(),
          ZKWxlScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14.w,
        unselectedFontSize: 14.w,
        items: const [
          BottomNavigationBarItem(
              label: '首页',
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: '邱齐林',
              icon: Icon(Icons.print)
          ),
          BottomNavigationBarItem(
              label: '王小腊',
              icon: Icon(Icons.people)
          )
        ],
        onTap: (index){
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
