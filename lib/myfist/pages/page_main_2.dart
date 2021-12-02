import 'package:flutter/material.dart';
import 'main/main_home.dart';
import 'main/main_find.dart';
import 'main/main_other.dart';
import 'main/main_mine.dart';

/// 此处使用pageView+BottomNavigationBar可实现内容左右滑动和点击切换

class MainScrollWidget extends StatefulWidget {
  const MainScrollWidget({Key? key}) : super(key: key);

  @override
  _MainScrollWidgetState createState() => _MainScrollWidgetState();
}

class _MainScrollWidgetState extends State<MainScrollWidget> {
  int _selectIndex = 0;

  List<Widget> pages = [];

  final selectColor = Colors.blue;

  final unselectColor = Colors.grey;

  var controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
        children: const <Widget>[
          Main1Widget(),
          MainScrollWidget(),
          Main3Widget(),
          Main4Widget()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // items: itemList,
        items: [
          BottomNavigationBarItem(
            title: Text("首页",
                style: TextStyle(
                    color: _selectIndex == 0 ? selectColor : unselectColor)),
            icon: Icon(Icons.home, color: unselectColor),
            activeIcon: Icon(
              Icons.home,
              color: selectColor,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("发现",
                style: TextStyle(
                    color: _selectIndex == 1 ? selectColor : unselectColor)),
            icon: Icon(Icons.find_in_page, color: unselectColor),
            activeIcon: Icon(
              Icons.find_in_page,
              color: selectColor,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("其它",
                style: TextStyle(
                    color: _selectIndex == 2 ? selectColor : unselectColor)),
            icon: Icon(Icons.other_houses, color: unselectColor),
            activeIcon: Icon(
              Icons.other_houses,
              color: selectColor,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("我的",
                style: TextStyle(
                    color: _selectIndex == 3 ? selectColor : unselectColor)),
            icon: Icon(Icons.manage_accounts_outlined, color: unselectColor),
            activeIcon: Icon(
              Icons.manage_accounts_outlined,
              color: selectColor,
            ),
          ),
        ],
        onTap: (int index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          setState(() {
            _selectIndex = index;
          });
          controller.jumpToPage(index);
        },
        //图标大小
        iconSize: 24,
        //当前选中的索引
        currentIndex: _selectIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
