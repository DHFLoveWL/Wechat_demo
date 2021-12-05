
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverChildPage extends StatelessWidget {

  final String? title;
  DiscoverChildPage(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title??""),
      ),
      body: Container(),
    );
  }
}
