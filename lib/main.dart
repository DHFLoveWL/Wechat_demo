import 'package:flutter/material.dart';
import 'package:wechat_demo/root_page.dart';
import 'package:wechat_demo/common_tool/http_request_manager.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    test();
    return MaterialApp(
      title:'wechatDemo',
      theme: ThemeData(
        highlightColor:const Color.fromRGBO(1, 0, 0, 0.0),
        splashColor: const Color.fromRGBO(1, 0, 0, 0.0),
        primarySwatch:Colors.grey
      ),
      home: rootPage(),
    );
  }
}

void test(){


}
// primarySwatch: Colors.grey

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currntIndex =0;
    return Container(
      child: Scaffold(


        appBar: AppBar(
          title: Text("wechant_demo"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){

          },
          currentIndex: _currntIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.chat),label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: '通讯录'),
            BottomNavigationBarItem(icon: Icon(Icons.history),label: '发现'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: '我的'),
          ],

        ),

      ),
    );
  }
}
