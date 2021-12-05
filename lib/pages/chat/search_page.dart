import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wechat_demo/font_color.dart';
import 'package:wechat_demo/pages/chat/search_bar.dart';
import 'chat_page.dart';

class SearchPage extends StatefulWidget {
  final List<ChatModel>? listData;
  SearchPage({this.listData});
  List<ChatModel> searResults = [];
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        child: Column(
          children: [
           SearchBar(
             onChanged: (str){

               if(str.isNotEmpty) {
                 searchResult(str);
               }

             },
           ),
            Expanded(child: Container(color: Colors.grey,child: ListView.builder(itemBuilder: _itemBuilder,

              itemCount: widget.searResults.length,),))
          ],
        ),
      ),
    );
  }
  Widget _itemBuilder(BuildContext context,int index){

    return ListTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: NetworkImage(widget.searResults[index].imageUrl!),
              )
          ),
        ),//头像
        title: Text(widget.searResults[index].name!),//姓名
        subtitle: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(right: 10),
          height: 25,
          child:  Text(widget.searResults[index].message!,overflow: TextOverflow.ellipsis,),//信息,
        )

    );
  }
  searchResult(String searchText){
    if (searchText.isNotEmpty && widget.listData!.isNotEmpty) {
      widget.searResults = [];
      print('statr');
      print(searchText);
      print(widget.listData!.length);
      for( int i =0;i<widget.listData!.length;i++){
        String name = widget.listData![i].name!;

        if(name.contains(searchText)){
          widget.searResults.add(widget.listData![i]);
        }
      }
      setState(() {

      });
      // print(searResults);
      // widget.searchResult!(searResults);//返回
    }
  }
}



void testFuture4() {
  Future  flutter1 = Future(() => null);
  Future flutter2 = flutter1.then((value) {
    print('6');
    scheduleMicrotask(() => print('7'));
  });

  flutter2.then((value) => print('8'));

  Future  flutter3 = Future(() => print('1'));
  flutter3.then((value) {
    print('4');
    Future(() => print('9'));
  }).then((value) => print('10'));

  Future(() => print('2'));


  scheduleMicrotask(() => print('3'));

  print('5');
}