import 'package:flutter/material.dart';
import 'package:wechat_demo/font_color.dart';
class FriendCell extends StatelessWidget {

  FriendCell({this.imageUrl, this.name, this.groupTitle, this.imageAssets});

  final String? imageUrl;
  final String? name;
  final String? groupTitle;
  final String? imageAssets;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(

        children: [
          //头部,没有标题的话不显示
          Container(
            child: groupTitle !=null ? Text(groupTitle!,style: TextStyle(color: Colors.grey),) : null,
            height: groupTitle != null ?30:0,
            color: ThemeColor,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15),
          ),
          Container(//cell内容
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(margin: EdgeInsets.all(10),child:imageAssets == null ? Image.network(imageUrl!,width: 34,height: 34,) : Image.asset(imageAssets!),height: 34,width: 34,),//头像
                Container(

                  alignment: Alignment.centerLeft,
                  width: screenWidth(context) -54,
                  child: Column(

                    children: [
                  Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: 15),child: Text(name!,style: TitleStyle,),height: 54,),//姓名
                  Container(color: ThemeColor,height: 0.5,),
                ],),)
              ],
            ),
          )
        ],

      ),

    );
  }
}

