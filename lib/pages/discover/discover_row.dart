import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';
class DiscoverCell extends StatefulWidget {
  final String title;
  final String? subTitle;
  final String imageName;
  final String? subImageName;

  DiscoverCell({
    required this.title,
    this.subTitle,
    required this.imageName,
    this.subImageName,
  })  : assert(title != null, 'title 不能为空！'),
        assert(imageName != null, 'imageName 不能为空！');

  @override
  State<StatefulWidget> createState() => _DiscoverCellState();
}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DiscoverChildPage(widget.title)));
        setState(() {
          _currentColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _currentColor = Colors.grey;
        });
      },
      onTapCancel: () {
        setState(() {
          _currentColor = Colors.white;
        });
      },
      child: Container(
        height: 55,
        color: _currentColor,
        child: Row(
          //主轴是spaceBetween
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //left
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  //图标
                  Image(
                    image: AssetImage(widget.imageName),
                    width: 20,
                  ),
                  //间隙
                  SizedBox(
                    width: 15,
                  ),
                  //Title
                  Text(widget.title),
                ],
              ),
            ),
            //right
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  //subTitle
                  widget.subTitle != null ? Text(widget.subTitle!) : Text(''),
                  //subImage
                  widget.subImageName != null
                      ? Image.asset(
                    widget.subImageName!,
                    width: 15,
                  )
                      : Container(),
                  //箭头
                  Image(
                    image: AssetImage('images/icon_right.png'),
                    width: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DiscoverCell1 extends StatefulWidget {
  String? iconImageName;
  String? title;
  String? desTitle;
  String? desIconImageName;
  DiscoverCell1({
    @required this.title,
    this.desTitle,
    @required this.iconImageName,
    this.desIconImageName,
  })  : assert(title != null, 'title 不能为空！'),
        assert(iconImageName != null, 'imageName 不能为空！');

  @override
  _DiscoverCell1State createState() => _DiscoverCell1State();
}

class _DiscoverCell1State extends State<DiscoverCell1> {

  Color _currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {

        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DiscoverChildPage(widget.title)));
        setState(() {
          _currentColor = Colors.orange;
        });


      },
      onTapDown: (TapDownDetails details) {
        print(details);

        setState(() {
          _currentColor = Colors.red;
        });
      },
      onTapCancel: (){
        setState(() {
          _currentColor = Colors.black12;
        });
      },


      child: Container(
        height: 55,

        color: _currentColor,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,//cell分为2份
          children: [
            //左边
            Container(
              padding: EdgeInsets.all(10),
              child: Row(children: [
                Image.asset(widget.iconImageName!,width: 20,),
                SizedBox(width: 15,),
                Text(widget.title!),
              ],),
            ),

            //右边
            Container(
              child: Row(
                children: [
                  widget.desTitle != null ? Text(widget.desTitle!) :Container(),
                  widget.desIconImageName != null ? Image.asset(widget.desIconImageName!,width: 20,) :Container(),
                  Image.asset('images/icon_right.png',width: 15,),//箭头
                  SizedBox(width: 15,)
                ],
              ),
            )


          ],

        ),
        // child: Stack(
        //   alignment: Alignment.bottomLeft,
        //   children: [


        // Container(
        //    margin:EdgeInsets.only(left: 50) ,
        //     width: width-50, height: 0.5, color: Colors.grey),
        //
        // Row(
        //
        //   children: <Widget>[Container(width: 50, height: 10, color: Colors.white),
        //   Container(height: 10, color: Colors.grey)
        // ],
        // )

        // ],
        // )



      ),
    );

  }
}

