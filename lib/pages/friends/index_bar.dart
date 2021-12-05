import 'package:flutter/material.dart';
import 'package:wechat_demo/font_color.dart';

import 'friends_data.dart';

class CloumnIndexBar extends StatefulWidget {

  final void Function(String str) indexBarCallBack;
  CloumnIndexBar({required this.indexBarCallBack});

  @override
  _CloumnIndexBarState createState() => _CloumnIndexBarState();
}
//获取选中的Item的字符！！
int getIndex(BuildContext context, Offset globalPosition) {
  //拿到点前小部件的盒子
  RenderBox box = context.findRenderObject() as RenderBox ;
  //拿到y值，globalToLocal当前位置我部件的原点(小部件左上角)的距离（x,y）
  double y = box.globalToLocal(globalPosition).dy;
  //算出字符高度
  var itemHeight = screenHeight(context) / 2 / INDEX_WORDS.length;
  //算出第几个item
  int index = (y ~/ itemHeight).clamp(0, INDEX_WORDS.length - 1);
  return index;
}
class _CloumnIndexBarState extends State<CloumnIndexBar> {

  Color _backgroundColor = Color.fromRGBO(1, 1, 1, 0);
  Color _textColor = Colors.black;
  double _indicatorOffsetY = 0.0; // -1.1到1.1之间的偏移量  中心点的是0
  bool _indicatorHidden = true; // 是否隐藏
  String _indicatorText = 'A'; // 当前正在显示的字母

  @override
  void initState(){

  }


  @override
  Widget build(BuildContext context) {
    final List<Widget> _words = [];

    for(int i = 0 ;i<INDEX_WORDS.length;i++){

      _words.add(Expanded(child: Text(INDEX_WORDS[i],style: TextStyle(fontSize: 10,color: _textColor),)));

    }
    return Positioned(
      top: screenHeight(context)/8,
      width: 120,
      right: 0,
      height: screenHeight(context)/2,
      child:
       Container(
         child:
         Row(
           children: [
             Container(

               alignment: Alignment(0,_indicatorOffsetY),
               width: 100,

               child: _indicatorHidden ? null : Stack(
                 alignment: Alignment(-0.2,0),
                 children: [
                   Image(
                     image: AssetImage('images/气泡.png'),
                     width: 60,
                   ),
                   Text(_indicatorText,
                     style: TextStyle(fontSize: 35, color: Colors.white),
                   )
                 ],
               ),
             ),
             GestureDetector(
               //拖拽
               onVerticalDragUpdate: (DragUpdateDetails details){
                 setState(() {
                   int  index  =  getIndex(context, details.globalPosition);
                   widget.indexBarCallBack(INDEX_WORDS[index]);
                   setState(() {
                     _indicatorOffsetY = 2.2 / INDEX_WORDS.length * index - 1.1;
                     _indicatorText = INDEX_WORDS[index];
                     _indicatorHidden = false;
                   });

                 });
               },
               //点击
               onVerticalDragDown: (DragDownDetails details){
                 setState(() {
                   int  index  =  getIndex(context, details.globalPosition);
                   widget.indexBarCallBack(INDEX_WORDS[index]);
                   print('手势进入的位置：$details');

                   _indicatorOffsetY = 2.2 / INDEX_WORDS.length * index - 1.1;
                   _indicatorText = INDEX_WORDS[index];
                   _indicatorHidden = false;
                   _backgroundColor = Color.fromRGBO(1, 1, 1, 0.5);
                   _textColor = Colors.white;
                 });

               },
               //离开
               onVerticalDragEnd:(DragEndDetails details){
                 setState(() {
                   _backgroundColor = Color.fromRGBO(1, 1, 1, 0);
                   _textColor = Colors.black;
                   _indicatorHidden = true;

                 });

               },
               child:
               Container(
                 width: 20,
                 color:_backgroundColor,
                 child:
                 Column(
                   children: _words,
                 ),
               ),
             )
           ],
         ),
       )
    );
  }
}







class IndexBar extends StatefulWidget {

  @override
  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  Widget _item (BuildContext context,int index){
    return Container(
      alignment: Alignment.center,
      height: 15,
      child:
      Expanded(
        child:
        Text(INDEX_WORDS[index],style: TextStyle(fontSize: 10,color: Colors.grey),),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(itemBuilder: _item,itemCount: INDEX_WORDS.length,),
    );
  }
}

