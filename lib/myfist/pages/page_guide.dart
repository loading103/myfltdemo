import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myflutterdemo/base/page_base.dart';
import 'package:myflutterdemo/myfist/pages/page_main_1.dart';

class GuideWidget extends StatefulWidget {
  const GuideWidget({Key? key}) : super(key: key);

  @override
  _GuideWidgetState createState() => _GuideWidgetState();
}

class _GuideWidgetState extends BasePage<GuideWidget> {

  var showButton=true;

  List<String> pic=[
    "https://img1.baidu.com/it/u=2833788443,1884841509&fm=26&fmt=auto",
    "https://img0.baidu.com/it/u=1836783140,4030915596&fm=26&fmt=auto",
    "https://img1.baidu.com/it/u=1410920735,585129848&fm=253&fmt=auto&app=138&f=JPEG?w=281&h=500",
    "https://img0.baidu.com/it/u=1542026583,2581346337&fm=26&fmt=auto"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:<Widget> [
        Container(
          child: Swiper(
            itemCount: pic.length,
            itemBuilder: getItem,
            autoplay: false,
            loop: false,
            onTap: (index){
              Fluttertoast.showToast(
                  msg: "点击了第几张banner",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            },

            pagination:  const SwiperPagination(
                alignment: Alignment(0.0, 1.0),
                margin: EdgeInsets.only(bottom: 40),
                builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.blue,
                    color: Colors.lightBlueAccent,
                    size: 10,
                    activeSize: 12,
                    space: 3
                )
            ),

            onIndexChanged: (index){
              setState(() {
                showButton=index!=pic.length-1;
              });
            },
          ),
        ),
        Offstage(
          offstage: showButton,
          child:  Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 70),
              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: GestureDetector(
                child: const Text("立即体验",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      decoration: TextDecoration.none
                  ),
                ),
                onTap: (){
                  pushRePage(const MainWidget());
                },
              ),
              decoration: const BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(10)),
                  color: Colors.red
              ),
            ),
          ),
        )
      ],
    );
  }


  Widget getItem(BuildContext context, int index){
    return Image.network(pic[index],fit: BoxFit.cover,);
  }
}
