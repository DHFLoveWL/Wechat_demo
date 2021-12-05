
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wechat_demo/common_tool/http_request_manager.dart';
import 'package:wechat_demo/pages/chat/search_page.dart';
import 'dart:convert';
import '../../font_color.dart';
import 'package:http/http.dart' as http;

class ChatModel{
  final String? name;
  final String? message;
  final String? imageUrl;
  ChatModel({this.name,this.message,this.imageUrl});
  factory ChatModel.formMap(Map map){
    return ChatModel(
      name: map['name'],
      message: map['content'],
      imageUrl: map['image'],
    );
  }
}
class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with AutomaticKeepAliveClientMixin<ChatPage> {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
  late Timer _timer;
  List<ChatModel> _listData = [] ;
 Future<List<ChatModel>> getListData()
  async {
    final url = Uri.parse('http://rap2api.taobao.org/app/mock/293940/home/chat/list');
    final response = await HttpRequstManager.get('http://rap2api.taobao.org/app/mock/293940/home/chat/list');
    if(response.statusCode == 200){
      var map =response.data;
      var listData = map['data'];
     List<ChatModel> data = listData.map<ChatModel>((item) => ChatModel.formMap(item)).toList();
     return data;

  }else{
    throw Exception('respose code is = ${response.statusCode}');
  }
  // print(map);

  final chatMap = {
    'name':'jack',
    'message':'helloworld'
  };

  final chatJson = json.encode(chatMap);
  print(chatJson);

  final newChatModel = json.decode(chatJson);
  print(newChatModel["name"]);
  print(newChatModel["message"]);
  print(newChatModel is Map);


  }
  @override
  void dispose() {
    // TODO: implement dispose
    if( _timer!= null && _timer.isActive  )
      {
        _timer.cancel();
      }
    print('页面销毁了');
    super.dispose();

  }
 @override void initState() {
   // TODO: implement initState
   super.initState();
   int count = 0;
   // _timer = Timer.periodic(Duration(seconds: 1), (timer) {
   //   count++;
   //   print(count);
   //   if(count == 99){
   //     timer.cancel();
   //   }
   // });

   getListData()
       .then((List<ChatModel> data){
     setState(() {
       _listData = data;
     });
   }).whenComplete(() {

     print('请求完成');
   } );
 }
  Widget _menuItemBuilder(String imageName,String title,) {
    return Container(
      child: Row(
        children: [
          Image.asset(imageName,width: 20,),
          SizedBox(width: 20,),
          Text(title,style: TextStyle(fontSize: 14,color: Colors.white),)
        ],
      ),
    );
  }


  Widget _itemBuilder(BuildContext context,int index){
    if(index == 0){
      return searcheCell();
    }
    index --;
    return ListTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: NetworkImage(_listData[index].imageUrl!),
              )
          ),
        ),//头像
        title: Text(_listData[index].name!),//姓名
        subtitle: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(right: 10),
          height: 25,
          child:  Text(_listData[index].message!,overflow: TextOverflow.ellipsis,),//信息,
        )

    );
  }

  Widget searcheCell(){

   return GestureDetector(
     onTap: (){


       Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SearchPage(listData: _listData,)));

       // Future((){
       // compute(func,123);
       // });
       print('点击了');
     },

     child: Container(
       height: 44,
       color: ThemeColor,
       padding: EdgeInsets.all(8),


       child: Stack(
         alignment: Alignment.center,
         children: [
           Container(
             decoration: BoxDecoration(
               color:Colors.white,
               borderRadius: BorderRadius.circular(6),
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset('images/放大镜b.png',color: Colors.grey,height: 15,),
               Text('搜索',style: TextStyle(color: Colors.grey),),
             ],
           ),
         ],
       )
     ),
   );

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('聊天页面'),
          backgroundColor: ThemeColor,
          elevation: 0,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: PopupMenuButton(
                  color: Color.fromRGBO(1, 1, 1, 0.65),
                  offset: Offset(0, 60.0),
                  child: Image(
                    image: AssetImage('images/圆加.png'),
                    width: 25,
                  ),
                itemBuilder: (BuildContext context){
                  return <PopupMenuItem<String>>[
                    PopupMenuItem(
                        child: _menuItemBuilder('images/发起群聊.png', '发起群聊')),
                    PopupMenuItem(
                        child: _menuItemBuilder('images/添加朋友.png', '添加朋友')),
                    PopupMenuItem(
                        child: _menuItemBuilder('images/扫一扫1.png', '扫一扫')),
                    PopupMenuItem(
                        child: _menuItemBuilder('images/收付款.png', '收付款')),
                  ];

                }


              )

            )


          ],

        ),

        body: _listData.isEmpty ?  Center(

            child:  buildText()
        ):ListView.builder(itemBuilder: _itemBuilder,
          itemCount: _listData.length+1,
        )
      ),
    );
  }

  Text buildText() => Text('页面加载中。。。');

}
FutureOr func(message) {
  print('start');
  for(int i = 0;i<100000000000;i++){};
  print('end');
}
