import 'package:flutter/material.dart';

// StatefulWidget与基础组件
class StatefulGroup extends StatefulWidget {
  @override
  _StatefulGroupState createState() => _StatefulGroupState();
}

class _StatefulGroupState extends State<StatefulGroup> {
  // 定义变量
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    // 样式
    TextStyle textStyle = TextStyle(fontSize: 20);

    return MaterialApp(
      title: 'StatefulWidget与基础组件---title',

      // 页面主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
         // 页面头部标题
        appBar: AppBar(
          title: Text('StatefulWidget与基础组件---home'),
          leading: GestureDetector(
          onTap: (){
              // 跳出页面
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        // 底部导航栏
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text('首页'),
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('列表'),
              icon: Icon(
                Icons.list, 
                color:Colors.grey
              ),
              activeIcon: Icon(
                Icons.list, 
                color:Colors.blue
              ),
            )
          ],
        ),
        // 悬浮按钮
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        // 页面内容
        body: this._currentIndex == 0 ? 
          RefreshIndicator(
            child: ListView(
              children: <Widget>[
                this.test()
              ],), 
            onRefresh: handleRefresh,
          )
        : 
        RefreshIndicator(
          child: ListView(
            children: <Widget>[
              Image.network('http://www.devio.org/img/avatar.png', width: 100, height: 100,),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  hintText: "请输入",
                  hintStyle: TextStyle(fontSize: 15)
                ) ,
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(color: Colors.lightGreenAccent),
                child: PageView(  // 轮播图
                  children: <Widget>[

                    this._item('Page1', Colors.deepPurple),

                    this._item('Page2', Colors.blue),

                    this._item('Page3', Colors.green),

                     this._item('Page4', Colors.red),
                  ],
                ),
              ),
              this.test2()
            ],), 
          onRefresh: handleRefresh,
        ),
      ),
    );
  }

  Future<Null> handleRefresh() async{
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  test() {
    print('test');
    return Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(children: <Widget>[

            // 设置文字样式
            // Text("t am text", style: textStyle,),
            Text("t am text", style: TextStyle(fontSize: 20),),

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

          ],),);
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white)),
    );
  }

  test2() {
    print('test2');
     return Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(children: <Widget>[

            // 设置文字样式
            // Text("t am text", style: textStyle,),
            Text("test 2 -- t am text", style: TextStyle(fontSize: 20),),

            // 设置图标
            Icon(Icons.android, size: 50, color: Colors.red),

            CloseButton(), // 关闭按钮
            BackButton(), // 返回按钮

            Chip(
              // 材料设计中一个非常有趣的小部件，什么是chip
              avatar: Icon(Icons.people),
              label: Text('test 2 -- StatelessWidget与基础组件'),
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
                child: Text('test 2 -- i am card', style: TextStyle(fontSize: 20),),
              )
            ),

            AlertDialog(
              title: Text("test 2 -- test"),
              content: Text('test 2 -- aaaaaaaaaaaaaaa'),
            )

          ],),);
  }
}
