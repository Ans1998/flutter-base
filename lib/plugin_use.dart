import 'package:flutter/material.dart';

import 'package:flutter_color_plugin/flutter_color_plugin.dart';


class PluginUse extends StatefulWidget {
  @override
  _PluginUsePageState createState() => _PluginUsePageState();
}

class _PluginUsePageState extends State<PluginUse> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter flutter_color_plugin"),
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
            Text(
              'You have ',
              style: TextStyle(color: ColorUtil.color('#f2f2f2')),
            )
          ],
        ),
      ),
    );
  }
}
