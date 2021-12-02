import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart' show AsyncMemoizer;
import 'package:myflutterdemo/base/page_base.dart';
import 'package:myflutterdemo/ui/pages/qql/model/activity_model.dart';
import 'package:myflutterdemo/ui/pages/qql/model/aysc_model.dart';
import 'package:myflutterdemo/ui/pages/qql/model/line_model.dart';
import 'package:myflutterdemo/ui/pages/qql/model/linetag_model.dart';
import 'package:myflutterdemo/ui/pages/qql/viewmodel/view_model.dart';
import 'package:myflutterdemo/ui/pages/qql/widgets/head_title.dart';
import 'package:myflutterdemo/ui/pages/qql/widgets/wigdet_activity_list.dart';
import 'package:myflutterdemo/ui/pages/qql/widgets/wigdet_anyi_sc.dart';
import 'package:myflutterdemo/ui/pages/qql/widgets/wigdet_travel_line.dart';
import 'package:myflutterdemo/ui/pages/qql/widgets/wigdet_travel_title.dart';
import 'package:myflutterdemo/ui/pages/wxl/model/banner_model.dart';
import 'package:myflutterdemo/ui/pages/wxl/viewModel/wxl_view_model.dart';
import 'package:myflutterdemo/ui/pages/wxl/widgets/advertising_widget.dart';
import 'package:myflutterdemo/ui/pages/wxl/widgets/banner_widget.dart';
import 'package:myflutterdemo/ui/pages/wxl/widgets/menu_widget.dart';
import 'package:myflutterdemo/ui/pages/wxl/widgets/quick_widget.dart';

class ZKHomeScreen extends StatefulWidget {
  @override
  State<ZKHomeScreen> createState() => _ZKHomeScreenState();
}

class _ZKHomeScreenState extends BasePage<ZKHomeScreen> {

  final AsyncMemoizer _bnnerMemoizer = AsyncMemoizer();
  final AsyncMemoizer _menuMemoizer = AsyncMemoizer();
  final AsyncMemoizer _advMemoizer = AsyncMemoizer();
  final AsyncMemoizer _quickMemoizer = AsyncMemoizer();

//  var _futureBannerData;
//  var _futureMenuData;
//  var _futureAdvData;
//  var _futureQuickData;

  ScrollController? _scrollController;
  BannerModel?  bannerData;
  List  menuDatas=[];
  List  advertDatas=[];
  List  questDatas=[];
  List<LinTagModel>  tagDatas=[];
  List<LineModel>  datas=[];
  List<AyscModel>  andatas=[];
  List<ActivityDatas> acticitydatas=[];

  GlobalKey<TravelLineWidgetState> textKey = GlobalKey();  //设置key,绑定待刷新控件.
  @override
  void initState() {
    super.initState();
    // 数据绑定
//    _futureBannerData = WxlViewModel.requestBanner();
//    _futureMenuData = WxlViewModel.requestMenus();
//    _futureAdvData = WxlViewModel.requestdvertising();
//    _futureQuickData = WxlViewModel.requestQuickMenu();
    // 数据绑定
    /// 数据绑定
    getTopData();
    getAyScList();
    getLineTagList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        children: [
          // 横幅界面
          FutureBuilder(
            future:_bnnerMemoizer.runOnce(WxlViewModel.requestBanner),
            builder: (ctx, shot){
              if (shot.connectionState == ConnectionState.done){
                return BannerItem(shot.data as BannerModel);
              }
              return Container(
                height: 400,
              );
            },
          ),
          // 菜单按钮界面
          FutureBuilder(
            future: _menuMemoizer.runOnce(WxlViewModel.requestMenus),
            builder: (ctx, shot){
              if (shot.connectionState == ConnectionState.done){
                return MenuQuickItem(shot.data as List);
              }
              return Container(
                height: 170,
              );
            },
          ),
          // 广告界面
          FutureBuilder(
            future: _advMemoizer.runOnce(WxlViewModel.requestdvertising),
            builder: (ctx, shot){
              if (shot.connectionState == ConnectionState.done){
                return AdvertisingPage(shot.data as List);
              }
              return Container(
                height: 110,
              );
            },
          ),
          // 快捷菜单界面
          FutureBuilder(
            future: _quickMemoizer.runOnce(WxlViewModel.requestQuickMenu),
            builder: (ctx, shot){
              if (shot.connectionState == ConnectionState.done){
                return QuickWidget(shot.data as List);
              }
              return Container(
                height: 98,
              );
            },
          ),
          // ///  横幅界面
          // BannerItem(bannerData!),
          //
          // /// 菜单按钮界面
          // MenuQuickItem(menuDatas),
          //
          // ///广告界面
          // AdvertisingPage(advertDatas),
          //
          // ///快捷菜单界面
          // QuickWidget(questDatas),
          /// 热门活动
          HeadItemTitle("热门活动","Hot Activities",onClickMoreCallBack: (value){
            if(value){
              showToast("查看热门活动");
            }
          }),
        ActivityWidget(_scrollController,acticitydatas),


          /// 安逸四川
          HeadItemTitle("安逸天府","Dynamic SiChuan",onClickMoreCallBack: (value){
            if(value){
              showToast("查看安逸天府");
            }
          }),
         AnScWidget(andatas),

          /// 精品路线
          HeadItemTitle("精品路线","Excellent Itineraries",onClickMoreCallBack: (value){
            if(value){
              showToast("查看精品路线");
            }
          }),
          ///精品路线小标题
          TravelLineTitleWidget(_scrollController,tagDatas,chooseTitleCallBack:(index){
            notifyItemData(tagDatas,index,false);
          }),

          TravelLineWidget(_scrollController,datas,key: textKey),
        ],
      ),
    );
  }

  void getTopData() async{
    bannerData =await WxlViewModel.requestBanner();
    menuDatas=await WxlViewModel.requestMenus();
    advertDatas=await WxlViewModel.requestdvertising();
    questDatas=await WxlViewModel.requestQuickMenu();
    setState(() {});
  }
  ///获取安逸四川标题
  void getAyScList() async{
    acticitydatas=await QqlViewModel.getActivityList();
    andatas=await QqlViewModel.getAyScList();
    setState(() {});
  }
  /// 获取线路标题
  void getLineTagList() async{
      tagDatas =await QqlViewModel.getLineTagList();
      notifyItemData(tagDatas, 0,true);
  }

  /// 局部更新线路
  void notifyItemData(List<LinTagModel> tags, index,bool isallfresh) async{
    datas =await QqlViewModel.getLineList(tags[index].tagId.toString());
    if(datas==null || datas.isEmpty){
      return;
    }
    if(isallfresh){
      setState(() {});
    }else{
      textKey.currentState?.callRefreshData(datas);
    }
  }



}
