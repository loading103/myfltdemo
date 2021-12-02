import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutterdemo/base/page_base.dart';
import 'package:myflutterdemo/common/colors.dart';
import 'package:myflutterdemo/utils/assets_utils.dart';

class HeadItemTitle extends StatefulWidget {

  var  title;

  var  content;

  String?  righttitle;

  final  onClickMoreCallBack;

  HeadItemTitle( this.title,this.content, {Key? key,this.righttitle,required this.onClickMoreCallBack}) : super(key: key);

  @override
  _HeadItemTitleState createState() => _HeadItemTitleState();
}

class _HeadItemTitleState extends BasePage<HeadItemTitle> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only( left: 20,right: 0,top: 40,bottom: 20),
      child: Row(
          children: <Widget>[
            Column(
              ///Column 控件靠左显示
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.title,style: const TextStyle(
                  fontSize: 24,
                  color: DefineColors.color_222222,
                  fontWeight: FontWeight.bold,
                ),
                ),

                const SizedBox(height:15),

                Text(widget.content,style: const TextStyle(
                  fontSize: 12,
                  color: DefineColors.color_999999,
                )),
              ],

            ),

            ///自动挤压
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap:(){
                // showToast("1111");
                widget.onClickMoreCallBack(true);
              },
              child: Text(widget.righttitle ?? "查看更多", style: const TextStyle(
                fontSize: 14,
                color: DefineColors.color_32bd5d,
              )),
            ),
            Image(image: AssetImage(AssetsUtils.getImgPath("home_button_arrow_more")),width: 13,height: 13,),
            const SizedBox(width:10),
          ],
        ),

    );
  }

}
