import 'package:flutter/material.dart';

// 手势事件
class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString = '';
  
  double moveX=0, moveY=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 全屏背景颜色
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        // 头部导航栏
        appBar: AppBar(
          title: Text("如何检测用户手势"),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        // 内容
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => this._printMsg('点击'),
                    onDoubleTap: () => this._printMsg('双击'),
                    onLongPress: () => this._printMsg('长按'),
                    onTapCancel: () => this._printMsg('取消'),
                    onTapUp: (e) => this._printMsg('松开'),
                    onTapDown: (e) => this._printMsg('按下'),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Text("点我", style: TextStyle(fontSize: 36, color: Colors.white),)
                    ),
                  ),
                  Text(this.printString)
                ],
              ),
              Positioned(
                left: this.moveX,
                top: this.moveY,
                child: GestureDetector(
                  onPanUpdate: (e) => _doMove(e),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(36)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
     

    );
  }
  _printMsg(String msg) {
    setState(() {
      printString += ' , $msg'; 
    });
  }

  _doMove(DragUpdateDetails e) {
    print(e);
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
  }

}