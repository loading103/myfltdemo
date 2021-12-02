import 'package:flutter/material.dart';
import 'package:myflutterdemo/base/page_base.dart';
import 'package:myflutterdemo/common/colors.dart';
import 'package:myflutterdemo/ui/pages/qql/model/line_model.dart';

/// 精品线路
class TravelLineWidget extends StatefulWidget {

  ScrollController? controller;
  List<LineModel> data;
  TravelLineWidget(this.controller,this.data , {Key? key }) : super(key: key);


  @override
  TravelLineWidgetState createState() => TravelLineWidgetState();
}

class TravelLineWidgetState extends BasePage<TravelLineWidget> {

  void callRefreshData(List<LineModel> datas){
    setState(() {
      widget.data=datas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20,right: 0),
      child: GridView.count(
        controller: widget.controller,
        //水平子Widget之间间距
        crossAxisSpacing:20.0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), //禁用滑动事件
        //垂直子Widget之间间距
        mainAxisSpacing: 30.0,
        //GridView内边距
        padding: const EdgeInsets.only(right: 16),
        //一行的Widget数量
        crossAxisCount: 2,
        //子Widget宽高比例
        childAspectRatio:0.6,
        //子Widget列表
        children:
        List.generate(widget.data.length, (index) {
          return   Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft:Radius.circular( 5),topRight:Radius.circular( 5)),
                        child: Image.network(widget.data[index].imageUrls![0].url!,
                          height: 100,fit: BoxFit.cover,),
                      ),
                    ),
                  ],

                ),
                SizedBox(height: 14,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Text((widget.data[index].summary! ==null ||  widget.data[index].summary! =="")?"这条线路将带我们走向胜利的方向，坚持不懈的走下去，你就会到达终点":widget.data[index].summary!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                    fontSize: 12,
                    color: DefineColors.color_333333,
                  ),),
                ),
                SizedBox(height: 22,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        child:Image.network(
                          "https://img0.baidu.com/it/u=2889371076,2512753262&fm=26&fmt=auto"
                          ,width:15 ,height:15,fit: BoxFit.cover,),
                      ),
                      const SizedBox(width: 4,),
                      Text(widget.data[index].tagName![0],style: const TextStyle(
                        fontSize: 11,
                        color: DefineColors.color_999999,
                      ),),
                      const Expanded(child: SizedBox()),
                      const Icon(Icons.collections_rounded,size: 15,),
                      Text(widget.data[index].showNum!.toString(),style: const TextStyle(
                        fontSize: 11,
                        color: DefineColors.color_999999,
                      ),),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        ),
      ),
    );
  }
}
