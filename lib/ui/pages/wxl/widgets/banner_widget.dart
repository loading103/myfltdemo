import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutterdemo/ui/pages/wxl/model/banner_model.dart';
import 'package:myflutterdemo/utils/screen_utils.dart';

/// 头部cell
class BannerItem extends StatelessWidget {

  final BannerModel _bannerModel;
  BannerItem(this._bannerModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.screenW(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image:NetworkImage(_bannerModel.coverImage!),
          fit: BoxFit.cover
        )
      ),
      child: Stack(
        children: [
          InfoWidget(_bannerModel),
          SearchWidget(),
          BottomWidget()
        ],
      ),
    );
  }
}

/// 内容
class InfoWidget extends StatelessWidget {
  final BannerModel _bannerModel;
  InfoWidget(this._bannerModel);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 120,
        left: 20,
        right: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(_bannerModel.weather!.pic!,width: 20,fit:BoxFit.cover),
                const SizedBox(width: 6),
                Text("${_bannerModel.weather!.min}-${_bannerModel.weather!.max}°",style: const TextStyle(
                  color: Colors.white,fontSize: 13
                ),)
              ],
            ),
            Text('${_bannerModel.name}',style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
            )),
            Text('${_bannerModel.english}',style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.7),
                fontSize: 14
            )),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_bannerModel.summary}',style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                )),
                Row(
                  children: [
                    const Text('城市名片',style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                        fontSize: 15
                    )),
                    const SizedBox(width: 2),
                    Image.asset('assets/images/home_button_arrow_city.png',height: 12)
                  ],
                )
                ]
            )
          ],
        ));
  }
}


/// 搜索
class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 20,
        right: 20,
        bottom: 60,
        child: Container(
          height: 38,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.25),
            borderRadius: BorderRadius.all(Radius.circular(4))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 12),
              Image.asset('assets/images/home_button_search.png',width: 15),
              SizedBox(width: 8),
              Text('搜索展览、演出、非遗等',style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400
              ),)
            ],
          ),
        )
    );
  }
}

/// 底部视图
class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        height: 24,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30))
          ),
        )
    );
  }
}