import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat/chat_page.dart';
import 'package:wechat_demo/pages/discover/discover_page.dart';
import 'package:wechat_demo/pages/friends/friends_page.dart';
import 'package:wechat_demo/pages/mine_page.dart';


class rootPage extends StatefulWidget {
  const rootPage({Key? key}) : super(key: key);

  @override
  _rootPageState createState() => _rootPageState();
}

class _rootPageState extends State<rootPage> {
  @override
  int _currentIndex = 0;
  List<Widget> _pages = [ChatPage(),FriendPage(),DiscoverPage(),MinePage()];
  final PageController _controller = PageController();

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {//页面改版的时候
            _currentIndex = index;
            setState(() {});
          },
          controller: _controller,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {//页面切换
              _currentIndex = index;
              _controller.jumpToPage(_currentIndex);

            });
          },

          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green,
          currentIndex: _currentIndex,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('images/tabbar_chat.png', height: 20, width: 20,),
                activeIcon: Image.asset('images/tabbar_chat_hl.png', height: 20, width: 20,),
                label: "微信"),
            BottomNavigationBarItem(
                icon:Image.asset('images/tabbar_friends.png',width: 20,height: 20,),
                activeIcon: Image.asset('images/tabbar_friends_hl.png',width: 20,height: 20,),
                label: '通讯录'),
            BottomNavigationBarItem(
                icon:Image.asset('images/tabbar_discover.png',width: 20,height: 20,),
                activeIcon: Image.asset('images/tabbar_discover_hl.png',width: 20,height: 20,),
                label: '发现'),
            BottomNavigationBarItem(
                icon: Image.asset("images/tabbar_mine.png",width: 20,height: 20,),
                activeIcon: Image.asset('images/tabbar_mine_hl.png',width: 20,height: 20,),
                label: '我的'),
          ],

        ),

      ),
    );
  }
}



