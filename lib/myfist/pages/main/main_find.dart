import 'package:flutter/material.dart';

import 'itempage/item_find_1.dart';
import 'package:myflutterdemo/base/page_base.dart';

class Main2Widget extends StatefulWidget{

  const Main2Widget({Key? key}) : super(key: key);

  @override
  _Main2WidgetState createState() => _Main2WidgetState();



}


class _Main2WidgetState extends BasePage<Main2Widget>  with SingleTickerProviderStateMixin{

  List<Widget> bodyPage=[];

  List<String> topTitle=[
    "推荐",
    "动态",
    "Java",
    "程序人生",
    "移动开发",
    "数据算法",
    "程序感言",
  ];

  var tabController;

  @override
  void initState() {
    super.initState();
    for(int i=0; i<topTitle.length;i++){
      bodyPage.add( const ItemFindWidget());
    }
    tabController=TabController(length: topTitle.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return   NestedScrollView(

      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            ///当 pinned = false appbar并没有固定在最上面,而是根据内容划出了界面:
            pinned: true,
            ///当为false时,向下滑动时,会先降列表内容滑动顶部,然后appbar会跟着列表滑动显示出来.
            ///当为true时,向下滑动时,appbar会先跟着列表滑动显示出来. 然后继续列表的滑动.
            floating:true,
            backgroundColor:  Colors.blue,
            centerTitle: false,
            ///阴影高度
            elevation: 0,
            brightness: Brightness.dark,
            /// false无leading自动填充  true时候显不填充
            automaticallyImplyLeading: false,
            actions:  <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: IconButton(onPressed: (){
                    showToast("点击了添加");
                  }, icon: const Icon(Icons.add_box,size: 24)),
              ),
            ],

            bottom: TabBar(
                labelStyle: const TextStyle(
                    fontSize: 16
                ),
                ///线条颜色
                indicatorColor: Colors.white,
                ///未选中字体颜色
                unselectedLabelColor: Colors.white,
                ///字体颜色
                labelColor: Colors.white,
                ///是否可以滑动
                isScrollable: true,
                ///控制器
                controller:tabController ,
                ///标题栏
                tabs: topTitle.map((bean) =>
                    Tab(text: bean)).toList()
            ),

            title: Material(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Ink(
                child: InkWell(
                  splashColor: Colors.lightBlue,
                  borderRadius: const BorderRadius.all(Radius.circular(5) ),
                  onTap: (){
                    showToast("点击了搜索");
                  },
                  child: Container(
                    height: 40,
                    decoration:  const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5) ),
                    ) ,
                    child: Row(
                      children: const [
                        SizedBox(width: 10),
                        Icon(Icons.search,size: 24,),
                        SizedBox(width: 10),
                        Text("搜索",style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            decoration: TextDecoration.none
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ];
      },
      body:  TabBarView(
          controller: tabController,
          children: bodyPage,
      ),
    );
  }
}

