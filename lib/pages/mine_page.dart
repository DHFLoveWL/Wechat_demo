import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'discover/discover_row.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
   File?  _avatarFile;
  final MethodChannel _methodChannel = const MethodChannel('mine_page/method');
  @override
  void initState() {
    super.initState();
    _methodChannel.setMethodCallHandler((call) async{
      if (call.method == 'imagePath') {


        String imagePath = call.arguments.toString().substring(7);
        print(call.arguments);
        print(imagePath);
        setState(() {
          _avatarFile = File(imagePath);
        });
      }else{
        return null;
      }
    });
  }
  Widget headView(){
    return Container(
      height: 200,
      color: Colors.white,

      padding: EdgeInsets.only(left: 20,top: 100),
      

      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,


        children: [
        GestureDetector(
          onTap:(){
            print('点击了头像');
            _methodChannel.invokeListMethod('pictureMethod');
          },
          child:  Container(

            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                // AssetImage('images/微信表情.png')
                image: _avatarFile == null
                ?const DecorationImage( image:
                     AssetImage('images/微信表情.png'),
                fit: BoxFit.cover)
               : DecorationImage(image:
                   FileImage(_avatarFile!),
                fit: BoxFit.cover)

            ),

          ),
        ),
          Expanded(
         //标题
          child: Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              //NickName
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  height: 30,
                  child:  Text('helloFlutter',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),

                //下标题
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 30,
                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,



                    children: [
                      Text('sdasd',style: TextStyle(fontSize: 14),),
                      //箭头
                      Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Image(
                          image: AssetImage('images/icon_right.png'),
                          width: 15,
                        ),
                      )
                    ],
                  ),
                )
              ],

            ),
          )

          ),
        ],
      ),
    );
  }
  // Widget headerWidget() {
  //   return Container(
  //     height: 200,
  //     color: Colors.white,
  //     child: Container(
  //       child: Container(
  //         margin: EdgeInsets.only(top: 100, bottom: 20, left: 20, right: 10),
  //
  //         child: Row(
  //           children: [
  //             //头像
  //             Container(
  //               width: 70,
  //               height: 70,
  //               decoration: BoxDecoration(
  //                   color: Colors.blue,
  //                   borderRadius: BorderRadius.circular(12),
  //                   image: _avatarFile == null
  //                       ? AssetImage('images/Hank.png')
  //                       : FileImage(_avatarFile),
  //                   fit: BoxFit.cover)),
  //             ),
  //             //右边的部分
  //             Container(
  //
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child:MediaQuery.removePadding(context: context,removeTop: true ,child:  Scaffold(
        body:Container(

            child: Stack(
              children: [
                ListView(
                  children: [
                    //头部
                    headView(),
                    //ist
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(
                      imageName: 'images/微信 支付.png',
                      title: '支付',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(
                      imageName: 'images/微信收藏.png',
                      title: '收藏',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 50, height: 0.5, color: Colors.white),
                        Container(height: 0.5, color: Colors.grey)
                      ],
                    ), //分割线
                    DiscoverCell(
                      imageName: 'images/微信相册.png',
                      title: '相册',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 50, height: 0.5, color: Colors.white),
                        Container(height: 0.5, color: Colors.grey)
                      ],
                    ), //分割线
                    DiscoverCell(
                      imageName: 'images/微信卡包.png',
                      title: '卡包',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 50, height: 0.5, color: Colors.white),
                        Container(height: 0.5, color: Colors.grey)
                      ],
                    ), //分割线
                    DiscoverCell(
                      imageName: 'images/微信表情.png',
                      title: '表情',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(
                      imageName: 'images/微信设置.png',
                      title: '设置',
                    ),
                  ],

                ),
                //         Container(
                //         // color: Colors.red,  Top Margin 40
                //         margin: EdgeInsets.only(top: 40, right: 15), height: 25,
                //         child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         children: [
                //           Image(image: AssetImage('images/相机.png')),]
                //
                //       )
                // )
                Positioned(
                    top: 40,
                    right: 15,
                    child: Image.asset('images/相机.png',height: 25,)),

              ],
            )
        ),
      ),)
    );
  }

}
