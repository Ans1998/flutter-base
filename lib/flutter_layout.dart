import 'package:flutter/material.dart';

// flutter布局
class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
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
            print(index);
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
            ), 
            BottomNavigationBarItem(
              title: Text('填充'),
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

        // 页面内容
        body: this.lay()

        // body:  RefreshIndicator(
        //     child: ListView(
        //       children: <Widget>[
        //         this.lay()
        //       ],), 
        //     onRefresh: handleRefresh,
        //   ),

      ),
    );
  }

  lay() {
    switch (this._currentIndex) {
      case 0:
      return RefreshIndicator(
            child: ListView(
              children: <Widget>[
                this.test()
              ],), 
            onRefresh: handleRefresh,
          );
      case 1:
         return RefreshIndicator(
            child: ListView(
              children: <Widget>[
                this.test2()
              ],), 
            onRefresh: handleRefresh,
          );
      case 2:
         return this.test3();
      default:
        return this.test3();
    }
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
            
            // 轮播图
           Container(
                height: 100,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.lightGreenAccent),
                child: 
                PhysicalModel(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  clipBehavior: Clip.antiAlias, // 抗锯齿
                  child: PageView(  // 轮播图
                    children: <Widget>[
                      this._item('Page1', Colors.deepPurple),
                      this._item('Page2', Colors.blue),
                      this._item('Page3', Colors.green),
                      this._item('Page4', Colors.red),
                    ],
                  ),
                ),
            ),

            // Column布局
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent
                  ),
                  child: Text('宽度撑满')
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent
                    ),
                    child: Text('宽度撑满')
                  ),
                )
              ],
            ),

            // 图片定位
            Stack(
              children: <Widget>[
                Image.network('http://www.devio.org/img/avatar.png', width: 100, height: 100,),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image.network('http://www.devio.org/img/avatar.png', width: 36, height: 36,),
                )
              ],
            ),

            // Wrap布局从左向右进行排列，会自动换行
            Wrap(
              spacing: 8, // 水平间距
              runSpacing: 6, // 垂直间距
              children: <Widget>[
                this._chip('Flutter1'),
                this._chip('Flutter2'),
                this._chip('Flutter3'),
                this._chip('Flutter4'),
                this._chip('Flutter5'),
              ],
            ),

            // Row 布局
            Row(children: <Widget>[
              ClipOval(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network('http://www.devio.org/img/avatar.png'),
                  ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  // 圆角
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Opacity(
                      opacity: 0.6,
                      child: Image.network('http://www.devio.org/img/avatar.png', width: 100, height: 100,),
                    ),
                ),
              )
            ],),

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

  _chip(String label) {
    return Chip(
        label: Text(label),
        avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900,
          child: Text(
            label.substring(0, 1),
            style: TextStyle(fontSize: 10),
          ),
        ),
      );
  }

   // 自动填充空白屏幕高度
  test3() {
     print('test3');
     return Column(
       children: <Widget>[
         Text('test3'),
         Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('拉伸填满高度'),
            )
         )
       ],
     );
    // return Container(
    //   decoration: BoxDecoration(color: Colors.white),
    //   alignment: Alignment.center,
    //   child: Column(
    //       children: <Widget>[
    //         Text('列表'),
    //         Expanded(
    //             child: Container(
    //           decoration: BoxDecoration(
    //             color: Colors.red,
    //           ),
    //           child: Text('拉伸填满高度'),
    //         ))
    //       ],
    //     ),
    // );
  }


}
