
import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_list.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Color _themeColor = Color.fromRGBO(220, 220, 220, 1.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('发现页面'),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: _themeColor,
        ),
        body: Container(
          color: _themeColor,

            child: DiscoverListView()
        ),
      ),
    );
  }
}