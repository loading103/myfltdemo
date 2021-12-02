import 'package:flutter/material.dart';
import 'package:myflutterdemo/common/colors.dart';
import 'package:myflutterdemo/ui/pages/qql/model/activity_model.dart';
import 'package:myflutterdemo/utils/string_utils.dart';

class ActivityWidget extends StatefulWidget {

  ScrollController? scrollController;

  List<ActivityDatas> data;

  ActivityWidget( this.scrollController,  this. data, {Key? key }) : super(key: key);

  @override
  _ActivityWidgetState createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:280,
      padding: const EdgeInsets.only(left: 20),
      child: ListView.builder(
        shrinkWrap: true,
        controller: widget.scrollController,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 300,
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    StringUtil.getImages(widget.data[index].images),
                    width: 300, height: 168,fit: BoxFit.cover,),
                ),
                const SizedBox(height: 16,),
                 Text( widget.data[index].name??"", style: const TextStyle(
                    fontSize: 16,
                    color: DefineColors.color_333333,
                    fontWeight: FontWeight.bold
                ),maxLines: 1,overflow:TextOverflow.ellipsis ,),
                const SizedBox(height: 10,),
                Text(widget.data[index].tagNames??"", style: const TextStyle(
                  fontSize: 11,
                  color: DefineColors.color_ff9e05,
                )),
                const SizedBox(height: 12,),
                 Text( widget.data[index].getOpenTime() ?? "", style: const TextStyle(
                  fontSize: 12,
                  color: DefineColors.color_999999,
                )),
              ],
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: widget.data.length,
      ),
    );
  }
}
