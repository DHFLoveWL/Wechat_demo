import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';
import 'package:wechat_demo/pages/friends/friend_cell.dart';
import 'package:wechat_demo/pages/friends/friends_data.dart';

import '../../font_color.dart';
import 'index_bar.dart';
import '../friends/friends_data.dart';
class FriendPage extends StatefulWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  double _cellHeight = 54.5;
  double _groupHeight = 30.0;
  //字典，里面放item和高度的对应的数据。
  final Map _groupOffsetMap = {
    INDEX_WORDS[0]: 0.0,
    INDEX_WORDS[1]: 0.0,
  };
  final List<Friends> _headerData = [
    Friends(imageAssets: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageAssets: 'images/群聊.png', name: '群聊'),
    Friends(imageAssets: 'images/标签.png', name: '标签'),
    Friends(imageAssets: 'images/公众号.png', name: '公众号'),
  ];
  final List<Friends> _listDatas = [];
  final ScrollController _scrollController =  ScrollController();
  final List<Widget> _words = [];



  Widget _itemBuilder(BuildContext context, int index) {
    bool isHideGroupTitle = (index -_headerData.length>0 &&_listDatas[index-_headerData.length].indexLetter == _listDatas[index-_headerData.length-1].indexLetter);
    if (index < _headerData.length) {
      //前4个
     return FriendCell(imageAssets: _headerData[index].imageAssets,
        name: _headerData[index].name,);
    } else {

     return FriendCell(
        imageUrl: _listDatas[index - _headerData.length].imageUrl,
        name: _listDatas[index - _headerData.length].name,
        groupTitle: isHideGroupTitle?null: _listDatas[index - _headerData.length ].indexLetter,);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listDatas
    ..addAll(datas)
    ..addAll(datas);
    //排序
    _listDatas.sort((Friends a, Friends b) {
      return a.indexLetter!.compareTo(b.indexLetter!);
    });

    for(int i = 0 ;i<INDEX_WORDS.length;i++){

      _words.add(Expanded(child: Text(INDEX_WORDS[i],style: const TextStyle(fontSize: 10,color: Colors.grey),)));

    }
    var _groupOffset = _cellHeight * _headerData.length;//默认位置

    //进过循环计算，将每一个头的位置算出来。放入字典
    for (int i = 0; i < _listDatas.length; i++) {
      if (i < 1) {
        //第一个cell一定有头！
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        //保存完了再加_groupOffset
        _groupOffset += _cellHeight + _groupHeight;
      } else if (_listDatas[i].indexLetter == _listDatas[i - 1].indexLetter) {
        //不同存，只需要加Cell的高度
        _groupOffset += _cellHeight;
      } else {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        //保存完了再加_groupOffset
        _groupOffset += _cellHeight + _groupHeight;
      }
    }
  }
    @override

  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);


  }


  @override
  Widget build(BuildContext context) {


    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('通讯录页面'),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: ThemeColor,
          actions: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DiscoverChildPage("添加朋友")));

              },
              child:Container(
                padding: const EdgeInsets.only(right: 15),
                child:  Image.asset('images/icon_friends_add.png',width: 25,),
              )
            ),

          ],

        ),
        body: Container(

            child:Stack(
              children: [
                ListView.builder(itemBuilder: _itemBuilder,
                  itemCount: _headerData.length+_listDatas.length,
                  controller: _scrollController,

                ),
                CloumnIndexBar(indexBarCallBack: (String str){

                  if (_groupOffsetMap[str] != null) {
                    _scrollController.animateTo(_groupOffsetMap[str],
                        duration: Duration(microseconds: 100),
                        curve: Curves.easeIn);
                  }
                  print('选中了$str');
                },)
              ],
            )
        ),
      ),
    );
  }
}