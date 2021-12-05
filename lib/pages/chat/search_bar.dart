import 'package:flutter/material.dart';
import 'package:wechat_demo/font_color.dart';
//
class SearchBar extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  SearchBar({this.onChanged});


  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool isShowCancleIcon = false;
  _onChanged(String text){

    if(widget.onChanged != null){
      widget.onChanged!(text);
    }

    setState(() {
      isShowCancleIcon = text.length>0;//当输入框内容大于0的时候显示清除按钮

    });
    print(text);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      color: ThemeColor,
      child: Column(
        children: [
          const SizedBox(height:40),//状态栏
          Container(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth(context)-40,
                  height: 34,
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  margin: const EdgeInsets.only(left: 5,right: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Row(
                    children: [
                      Image.asset('images/放大镜b.png',height: 20,),
                      Expanded(child:

                      TextField(
                        controller: _controller,
                        onChanged: _onChanged,
                        cursorColor: Colors.green,
                        autofocus: true,
                        style: const TextStyle(color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w300
                        ),
                        decoration: const InputDecoration(
                          hintText: '搜索',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5,bottom: 10),
                        ),
                      )
                      ),//输入框
                      if(isShowCancleIcon)
                        GestureDetector(
                          onTap: (){
                            _controller.clear();
                            _onChanged('');
                          },
                          child: const Icon(
                            Icons.cancel,
                            size: 20,
                            color: Colors.grey,

                          ),
                        )
                    ],
                  ),
                ),//搜索框和放大镜
                GestureDetector(
                  onTap: (){
                    print('返回');
                    Navigator.pop(context);
                  },

                  child: Text('取消'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


}

