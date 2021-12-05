import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_row.dart';

class DiscoverListView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListView(
        children: <Widget>[

        DiscoverCell(
        imageName: 'images/朋友圈.png',
        title: '朋友圈',
    ),
    SizedBox(
    height: 10,
    ),
    DiscoverCell(
    imageName: 'images/扫一扫2.png',
    title: '扫一扫',
    ),
    Row(
    children: <Widget>[
    Container(width: 50, height: 0.5, color: Colors.white),
    Container(height: 0.5, color: Colors.grey)
    ],
    ),
    DiscoverCell(
    imageName: 'images/摇一摇.png',
    title: '摇一摇',
    ),
    SizedBox(
    height: 10,
    ),
    DiscoverCell(
    imageName: 'images/看一看icon.png',
    title: '看一看',
    ),
    Row(
    children: <Widget>[
    Container(width: 50, height: 0.5, color: Colors.white),
    Container(height: 0.5, color: Colors.grey)
    ],
    ),
    DiscoverCell(
    imageName: 'images/搜一搜 2.png',
    title: '搜一搜',
    ),
    SizedBox(
    height: 10,
    ),
    DiscoverCell(
    imageName: 'images/附近的人icon.png',
    title: '附近的人',
    ),
    SizedBox(
    height: 10,
    ),
    DiscoverCell(
    imageName: 'images/购物.png',
    title: '购物',
    subTitle: '618限时特价',
    subImageName: 'images/badge.png',
    ),
    Row(
    children: <Widget>[
    Container(width: 50, height: 0.5, color: Colors.white),
    Container(height: 0.5, color: Colors.grey)
    ],
    ),
    DiscoverCell(
    imageName: 'images/游戏.png',
    title: '游戏',
    ),
    SizedBox(
    height: 10,
    ),
    DiscoverCell(
    imageName: 'images/小程序.png',
    title: '小程序',
    ),
    ],
    )
    );

    // return Container(
    //
    //   child:  ListView(
    //     children: <Widget>[
    //       DiscoverCell(
    //         iconImageName: 'images/朋友圈.png',
    //         title: '朋友圈',
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       DiscoverCell(
    //         iconImageName: 'images/扫一扫2.png',
    //         title: '扫一扫',
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Container(width: 50, height: 0.5, color: Colors.white),
    //           Container(height: 0.5, color: Colors.grey)
    //         ],
    //       ),
    //       DiscoverCell(
    //         iconImageName: 'images/摇一摇.png',
    //         title: '摇一摇',
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       DiscoverCell(
    //         iconImageName: 'images/看一看icon.png',
    //         title: '看一看',
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Container(width: 50, height: 0.5, color: Colors.white),
    //           Container(height: 0.5, color: Colors.grey)
    //         ],
    //       ),
    //       DiscoverCell(
    //         iconImageName: 'images/搜一搜 2.png',
    //         title: '搜一搜',
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       DiscoverCell(
    //         iconImageName: 'images/附近的人icon.png',
    //         title: '附近的人',
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       DiscoverCell(
    //         iconImageName: 'images/购物.png',
    //         title: '购物',
    //         desTitle: '618限时特价',
    //         desIconImageName: 'images/badge.png',
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Container(width: 50, height: 0.5, color: Colors.white),
    //           Container(height: 0.5, color: Colors.grey)
    //         ],
    //       ),
    //       DiscoverCell(
    //         iconImageName: 'images/游戏.png',
    //         title: '游戏',
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       DiscoverCell(
    //         iconImageName: 'images/小程序.png',
    //         title: '小程序',
    //       ),
    //     ],
    //   ),
    // );
  }
}