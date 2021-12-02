import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myflutterdemo/base/page_base.dart';
import 'package:myflutterdemo/common/colors.dart';
import 'package:myflutterdemo/ui/pages/qql/model/aysc_model.dart';

///安逸天府
class AnScWidget extends StatefulWidget {

  List<AyscModel>  datas;

  AnScWidget(this.datas);

  @override
  _ActivityWidgetState createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends BasePage<AnScWidget> {

  int  index=0;

  @override
  void initState() {
    super.initState();
    addTime();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.only(left: 20,right: 20),
      margin: const EdgeInsets.only(bottom: 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      widget.datas[index].backgroundImg!, fit: BoxFit.cover,height: 240,
                    ),
                  ),
                ),
                Positioned(
                  left:15 ,
                  bottom: 20,
                  child:   Container(
                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 12,right: 12),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all( Radius.circular(6)),
                      color: DefineColors.color_E6FFFFFF,

                    ),
                    child: Text(widget.datas[index].name!,style: const TextStyle(
                        color: DefineColors.color_333333,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),),

                  ),),
              ],
            ),
          ),
          const SizedBox(width: 12,),
          Expanded(
            flex:2,
            child: ListView.separated(
              physics:const NeverScrollableScrollPhysics(), //禁用
              padding: const EdgeInsets.only(top: 0),
              itemBuilder: (BuildContext context, int index){
                return  Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        widget.datas[index].backgroundImg!,fit: BoxFit.cover,height:52,width: 110,),
                    ),
                  ],);
              },
              itemCount:  widget.datas.length,
              scrollDirection: Axis.vertical,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 10.0,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addTime() {
    Future.delayed(const Duration(seconds: 3), () {
      if(!isactivite){
        return;
      }
      setState(() {
        index++;
        if(index==4){
          index=0;
        }
        addTime();
      });
    });
  }

  bool  isactivite=true;
  @override
  void dispose() {
    isactivite=false;
    super.dispose();
  }

}
