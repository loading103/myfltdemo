import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myflutterdemo/base/page_base.dart';
import 'package:myflutterdemo/myfist/widget/banner.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ItemFindWidget extends StatefulWidget {

  const ItemFindWidget({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends BasePage<ItemFindWidget> {

  ///下拉刷新控制器
  final _refreshController = RefreshController(initialRefresh: false);

  /// ios默认样式是ClassicHeader() 安卓默认MaterialClassicHeader（）
   Widget refreshHeader =   const MaterialClassicHeader(
     color: Colors.blue,
     backgroundColor: Colors.white,
   );

  ///下拉认控件
   LoadIndicator loadMoreFooter = const ClassicFooter(
     noDataText: "暂无更多数据",
     failedText: "加载失败",
     canLoadingText:"释放加载" ,
     loadingText: "加载中",
     idleText: "上拉加载更多",
   );

  List<String>urls=[
    "https://img1.baidu.com/it/u=3246628741,3439955235&fm=26&fmt=auto",
    "https://t7.baidu.com/it/u=3406125714,2513313326&fm=193&f=GIF",
    "https://img2.baidu.com/it/u=1947582535,1861087167&fm=26&fmt=auto",
    "https://img0.baidu.com/it/u=3031084643,1334557890&fm=26&fmt=auto",
    "https://img0.baidu.com/it/u=1940437512,224113858&fm=26&fmt=auto",
  ];
  List<String>datas=[
    "模拟数据1",
    "模拟数据2",
    "模拟数据3",
    "模拟数据4",
    "模拟数据5",
    "模拟数据6",
    "模拟数据7",
    "模拟数据8",
    "模拟数据9",
  ];


  @override
  Widget build(BuildContext context) {
    return   SmartRefresher(
      controller: _refreshController,
      /// 能否下拉刷新
      enablePullDown: true,
      ///能否上拉加载更多
      enablePullUp: true,
      /// 下拉刷新
      onRefresh: _onRefresh,
      /// 上拉加载更多
      onLoading: _onLoading,

      header:const ClassicHeader(),
      //
      // footer: loadMoreFooter,

      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        itemBuilder:getItemBuilder,
        itemCount: datas.length+1,

      ),
    );
  }

  /// 下拉刷新
  void _onRefresh() async{
    datas.insert(0,"我是下拉新增数据");
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
    });
    _refreshController.refreshCompleted();
  }
  /// 上拉加载更多
  void _onLoading() async{
    datas.add("我是上拉新增数据");
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
    });
    _refreshController.loadNoData();
  }



  Widget getItemBuilder(BuildContext context, int index){
    if(index==0){
      return  BannerWidget(urls);
    }else{
      return Container(
        height: 80,
        color: Colors.primaries[index % Colors.primaries.length],
        alignment: Alignment.center,
        child: Text(
          datas[index-1],
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    }
  }







}
