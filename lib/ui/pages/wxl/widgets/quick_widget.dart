import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutterdemo/ui/pages/wxl/model/quick_model.dart';

///  快捷菜单item
class QuickWidget extends StatelessWidget {
  final List _list;
  const QuickWidget(this._list);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      color: Colors.white60,
      padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
      child: ListView.builder(
          itemCount: _list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, row) {
            QuickModel model = _list[row%(_list.length)];
            return Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(248, 248, 248, 1),
                    offset: Offset(0, 5),
                    // 模糊程度
                    blurRadius: 5.0,
                    // 扩散程度
                    spreadRadius: 1,
                  )
                ]
              ),
                child: Image.network(model.imgUrl!)
            );
          }),
    );
  }
}
