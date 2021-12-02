import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:myflutterdemo/base/page_base.dart';
import 'package:myflutterdemo/myfist/util/screen_utils.dart';

class BannerWidget extends StatefulWidget {

  List<String> urls=[];


  BannerWidget(this.urls, {Key? key}) : super(key: key);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends BasePage<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: ScreenUtils.screenW(context),
      height: 200,
      child: Swiper(
        itemCount: widget.urls.length,
        itemBuilder:  (BuildContext context,int index){
          return Image.network(widget.urls[index],fit: BoxFit.cover);
        },
        autoplay: true,
        autoplayDelay:5000,
        loop:true,
        scrollDirection: Axis.horizontal,
        onTap: (index){
          showToast("点击了第$index个banner");
        },
        pagination:  const SwiperPagination(
            alignment: Alignment(1.0, 1.0),
            builder: DotSwiperPaginationBuilder(
                activeColor: Colors.blue,
                color: Colors.white,
                size: 10,
                activeSize: 12,
                space: 3
            )
        ),

      ),
    );
  }


}
