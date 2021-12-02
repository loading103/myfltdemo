import 'package:flutter/material.dart';
import 'package:myflutterdemo/base/page_base.dart';

class BottomSheetDemo extends StatefulWidget {

  final onChooseCallBack;

  final String title;

  const BottomSheetDemo({Key? key, required this.title,required this.onChooseCallBack}) : super(key: key);

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends BasePage<BottomSheetDemo> {

  List<String> nameItems = <String>['微信', '朋友圈', 'QQ', '微博', '链接'];
  int selectIndex=0;
  void undateSelectIndex(int index){
    setState(() {
      selectIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        splashColor: Colors.blueGrey,
        onTap: (){
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            /// showModalBottomSheet无法更新状态问题,需要使用StatefulBuilder。
            builder: ( context)=> StatefulBuilder(
                builder: ( context,  setState) {
                  return buildBottomSheetDemoWidget(context,setState);
                }
            ),
          );
        },
        child:  Container(
          // padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children:  <Widget>[
                const SizedBox(height: 15,),
                Text(widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),),
                const SizedBox(height: 15,),
                const Divider(height: 1, color: Colors.grey)
              ],
            ),
          ),
        ),
      );
  }

  Widget buildBottomSheetDemoWidget(BuildContext context, StateSetter setState) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight:  Radius.circular(12)),
        color: Colors.white,
      ),

      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(nameItems[index],style:  TextStyle(
                    fontSize: 16,
                    color: selectIndex==index ? Colors.lightBlue:Colors.grey,
                  ),),
                ),
                const Divider(height: 1.0,color: Colors.grey,),
              ],
            ),

            onTap: () {
              setState((){
                switch (nameItems[index]) {
                  case '微信':
                    widget.onChooseCallBack("微信");
                    selectIndex=0;
                    break;
                  case '朋友圈':
                    widget.onChooseCallBack("朋友圈");
                    selectIndex=1;
                    break;
                  case 'QQ':
                    widget.onChooseCallBack("QQ");
                    selectIndex=2;
                    break;
                  case '微博':
                    widget.onChooseCallBack("微博");
                    selectIndex=3;
                    break;
                  case '链接':
                    selectIndex=4;
                    widget.onChooseCallBack("链接");
                    break;
                }
              });
            },
          );
        },
        itemCount: nameItems.length,
      ),
    );
  }
}
