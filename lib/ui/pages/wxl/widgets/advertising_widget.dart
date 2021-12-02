import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:myflutterdemo/ui/pages/wxl/model/advertising_model.dart';

/// 广告item
class AdvertisingPage extends StatefulWidget {

  final List _advList;
  const AdvertisingPage(this._advList);
  @override
  _AdvertisingPageState createState() => _AdvertisingPageState(_advList);
}

class _AdvertisingPageState extends State<AdvertisingPage> {
  final List _advList;
  _AdvertisingPageState(this._advList);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
      height: 110,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Swiper(
          itemBuilder: (ctx, row){
            AdvertisingModel model = _advList[row];
            return Image.network(model.imgUrl!);
          },
          itemCount: _advList.length,
          // 底部分页器
          pagination: const SwiperPagination(builder: DotSwiperPaginationBuilder(
            activeColor: Colors.white,
            color: Colors.white70,
            size: 6,
            activeSize: 7
          )),
          // 无限滚动
          loop: true,
          // 自动轮播flutter run
          autoplay: true,
        ),
      )
    );
  }
}
