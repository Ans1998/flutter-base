import 'package:flutter/material.dart';

import 'package:flutter_color_plugin/flutter_color_plugin.dart';

// flutter引入本地资源（先来pubspec.yaml配置assets）
class ResPage extends StatefulWidget {
  @override
  _ResPageState createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter ResPage"),
        leading: GestureDetector(
          onTap: (){
            // 跳出页面
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Image(
             height: 300,
             image: AssetImage('images/aaa.png'),
           )
          ],
        ),
      ),
    );
  }
}
