import 'package:flutter/material.dart';
import 'package:myflutterdemo/base/page_base.dart';
import 'package:myflutterdemo/common/colors.dart';
import 'package:myflutterdemo/ui/pages/qql/model/linetag_model.dart';

/// 精品线路(标题)
class TravelLineTitleWidget extends StatefulWidget {

  ScrollController? controller;

  final chooseTitleCallBack;

  List<LinTagModel> data;

  int titleIndex=0;

  TravelLineTitleWidget(this.controller, this.data, {Key? key,required this.chooseTitleCallBack}) : super(key: key);

  @override
  TravelLineTitleWidgetState createState() => TravelLineTitleWidgetState();
}

class TravelLineTitleWidgetState extends BasePage<TravelLineTitleWidget> {


  final  List<Color> checkedColor = [Colors.green, Colors.greenAccent,];

  final  List<Color> unCheckedColor=[ Colors.white, Colors.white,];

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 56,
      padding: const EdgeInsets.only(bottom: 24,left: 20),
      child: ListView.separated(
          shrinkWrap: true,
          controller: widget.controller,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){
            return  GestureDetector(
              onTap: (){
                setState(() {
                  widget.titleIndex=index;
                  widget.chooseTitleCallBack(index);
                });
              },
              child: Container(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 7,bottom:7),
                decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: widget.titleIndex==index ?const Color(0x1AC8E6C9) :DefineColors.color_80999999),
                  gradient:  LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.titleIndex==index ? checkedColor:unCheckedColor,
                  ),
                ),

                child:  Center(child: Text(widget.data[index].tagName! ,style:
                TextStyle(
                    fontSize: 14,
                    color: widget.titleIndex==index ? Colors.white :DefineColors.color_333333),
                ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index){
            return const VerticalDivider(
              color: Colors.white,
              width: 8,
            );
          },
          itemCount: 6),
    );
  }
}
