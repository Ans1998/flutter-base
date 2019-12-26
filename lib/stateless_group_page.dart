import 'package:flutter/material.dart';

// StatelessWidget与基础组件
class LessStatelessWidgetPages extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // 样式
    TextStyle textStyle = TextStyle(fontSize: 20);

    return MaterialApp(
      title: 'StatelessWidget与基础组件---title',

      // 页面主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // 页面头部标题
      home: Scaffold(
        appBar: AppBar(title: Text('StatelessWidget与基础组件---home'),
        leading: GestureDetector(
          onTap: (){
            // 跳出页面
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),

      // 页面内容
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        alignment: Alignment.center,
        child: Column(children: <Widget>[

          // 设置文字样式
          Text("t am text", style: textStyle,),
          // Text("t am text", style: TextStyle(fontSize: 20),),

          // 设置图标
          Icon(Icons.android, size: 50, color: Colors.red),

          CloseButton(), // 关闭按钮
          BackButton(), // 返回按钮

          Chip(
            // 材料设计中一个非常有趣的小部件，什么是chip
            avatar: Icon(Icons.people),
            label: Text('StatelessWidget与基础组件'),
          ),

          Divider(
            height: 10, // 容器高度
            indent: 10, // 左侧间距
            color: Colors.orange,
          ),

          Card(
            // 带有圆角，阴影，边框等效果的卡片
            color: Colors.blue,
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text('i am card', style: TextStyle(fontSize: 20),),
            )
          ),

          AlertDialog(
            title: Text("test"),
            content: Text('aaaaaaaaaaaaaaa'),
          )

        ],),)
      ),
    );
  }
}
