import 'package:flutter/material.dart';
import 'main/main_home.dart';
import 'main/main_find.dart';
import 'main/main_other.dart';
import 'main/main_mine.dart';

/// 此处使用Offstage可实现内容点击切换

class MainWidget extends StatefulWidget {

  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}


class _MainWidgetState extends State<MainWidget> {

  int _selectIndex =0;

  List<Widget> pages=[
    const Main1Widget(),
    const Main2Widget(),
    const Main3Widget(),
    const Main4Widget()
  ];

  final selectColor=Colors.blue;

  final unselectColor=Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Builder(builder: (BuildContext ctx) {
      //     return IconButton(
      //         icon: Container(
      //           decoration: const BoxDecoration(
      //             shape: BoxShape.circle,
      //             image: DecorationImage(
      //               image: AssetImage(
      //                 "assets/images/ic_launcher.png"
      //               ),
      //             ),
      //           ),
      //         ),
      //         onPressed: () {
      //           Scaffold.of(ctx).openDrawer();
      //         });
      //   }),
      //   centerTitle: true,
      // ),
      body: Stack(
        children:  <Widget>[
          getSelectWigdet(0),
          getSelectWigdet(1),
          getSelectWigdet(2),
          getSelectWigdet(3),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // items: itemList,
        items:  [
          BottomNavigationBarItem(
            title:  Text("首页",
                style: TextStyle(color: _selectIndex ==0 ? selectColor: unselectColor)),
            icon:  Icon(Icons.home,color: unselectColor),
            activeIcon:  Icon(Icons.home,color: selectColor,),
          ),
          BottomNavigationBarItem(
            title:  Text("发现",
                style: TextStyle(color: _selectIndex ==1 ? selectColor: unselectColor)),
            icon:  Icon(Icons.find_in_page,color: unselectColor),
            activeIcon:  Icon(Icons.find_in_page,color: selectColor,),
          ),
          BottomNavigationBarItem(
            title:  Text("其它",
                style: TextStyle(color: _selectIndex ==2 ? selectColor: unselectColor)),
            icon:  Icon(Icons.other_houses,color: unselectColor),
            activeIcon:  Icon(Icons.other_houses,color: selectColor,),
          ),
          BottomNavigationBarItem(
            title:  Text("我的",
                style: TextStyle(color: _selectIndex ==3 ? selectColor: unselectColor)),
            icon:  Icon(Icons.manage_accounts_outlined,color: unselectColor),
            activeIcon:  Icon(Icons.manage_accounts_outlined,color: selectColor,),
          ),
        ],
        onTap: (int index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          setState(() {
            _selectIndex = index;
          });
        },
        //图标大小
        iconSize: 24,
        //当前选中的索引
        currentIndex: _selectIndex,
        type: BottomNavigationBarType.fixed,
      ),
      drawer: const Drawer(
        child: Text("我是抽屉"),
      ),
    );
  }

  Widget getSelectWigdet(int index){
    return Offstage(
      offstage: _selectIndex!=index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }
}
