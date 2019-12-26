import 'package:flutter/material.dart';

// import './plugin_use.dart'; // 插件使用
// void main() => runApp(PluginUse());

// import './stateless_group_page.dart'; // StatelessWidget基础使用
// void main() => runApp(LessStatelessWidgetPages());

// import './statefull_group_page.dart'; // StatefulWidget基础使用
// void main() => runApp(StatefulGroup());

// import './flutter_layout.dart'; // flutter布局
// void main() => runApp(FlutterLayoutPage());

import './plugin_use.dart'; // 插件使用
import './stateless_group_page.dart'; // StatelessWidget基础使用
import './statefull_group_page.dart'; // StatefulWidget基础使用
import './flutter_layout.dart'; // flutter布局
import './gesture_page.dart'; // flutter事件
import './res_page.dart'; // flutter本地资源
import './launch_page.dart'; // 打开第三方应用
import './flutter_widget_lifecycle.dart'; // 生命周期
import './app_lifecycle.dart';


void main() => runApp(DynamicTheme());

// 修改应用主题
class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {

  Brightness _brightness = Brightness.light;

  // 字体下载地址：https://fonts.google.com/specimen/Rubik+Mono+One?selection.family=Rubik+Mono+One
  // 更多参考：https://flutter.dev/docs/cookbook/design/fonts
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'RubikMonoOne', // 设置自定义字体设置为全局
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
         // 页面头部标题
        appBar: AppBar(
          title: Text('导航'),
        ),

        
        // 
        body: Container(
          child: Column(children: <Widget>[
            Container(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (_brightness == Brightness.dark) {
                        _brightness = Brightness.light;
                      } else {
                        _brightness = Brightness.dark;
                      }
                    });
                  },
                  // style: TextStyle(fontFamily: 'RubikMonoOne')
                  child: Text('切换主题aaa',),
                ),
            ),
            RouteNavigator() // 警告的意思是 只能有一个根节点
          ],
          )
        )
      ),
      routes: <String, WidgetBuilder> {
        'plugin': (BuildContext context) => PluginUse(),
        'less': (BuildContext context) => LessStatelessWidgetPages(),
        'ful': (BuildContext context) => StatefulGroup(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gesturePage': (BuildContext context) => GesturePage(),
        'resPage': (BuildContext context) => ResPage(),
        'launchPage': (BuildContext context) => LaunchPage(),
        'widgerLifecycle': (BuildContext context) => WidgerLifecycle(),
        'appLifecyclePage': (BuildContext context) => AppLifecyclePage(),
      },
    );
  }

}


// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(

         // 页面头部标题
        appBar: AppBar(
          title: Text('导航'),
        ),

        body: RouteNavigator()

      ),

      routes: <String, WidgetBuilder> {
        'plugin': (BuildContext context) => PluginUse(),
        'less': (BuildContext context) => LessStatelessWidgetPages(),
        'ful': (BuildContext context) => StatefulGroup(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gesturePage': (BuildContext context) => GesturePage(),
        'resPage': (BuildContext context) => ResPage(),
        'launchPage': (BuildContext context) => LaunchPage(),
        'widgerLifecycle': (BuildContext context) => WidgerLifecycle(),
        'appLifecyclePage': (BuildContext context) => AppLifecyclePage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}


class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[

          SwitchListTile(
            title: Text("${byName ? '' : '不'}---通过路由名跳转"),
            value: byName, 
            onChanged: (value) {
              setState(() {
                byName = value;
              });
            }
          ),

          this._item('plugin title', PluginUse(), 'plugin'),
          this._item('less title', LessStatelessWidgetPages(), 'less'),
          this._item('ful title', StatefulGroup(), 'ful'),
          this._item('layout title', FlutterLayoutPage(), 'layout'),
          this._item('gesturePage title', GesturePage(), 'gesturePage'),
          this._item('resPage title', ResPage(), 'resPage'),
          this._item('launchPage title', LaunchPage(), 'launchPage'),
          this._item('widgerLifecycle title', WidgerLifecycle(), 'widgerLifecycle'),
          this._item('appLifecyclePage title', AppLifecyclePage(), 'appLifecyclePage')
        ],
      ),
    );
  }

  _item(String title, page, String routeName ) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}