import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _MarketPage();
  }
}

class _MarketPage extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('知识体系'),
      ),
      body: new Center(
        child: new Text('知识体系页面'),
      ),
    );
  }
}