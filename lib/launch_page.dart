import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

// 打开第三方应用
class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {

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
           RaisedButton(
             onPressed: () => _launchURl(),
             child: Text('打开浏览器'),
           ),
           RaisedButton(
             onPressed: () => _openMap(),
             child: Text('打开地图'),
           )
          ],
        ),
      ),
    );
  }
  _launchURl() async {
    const url = 'https://flutterchina.club/upgrading/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _openMap() async{
    // Android
    const url = "geo:52.32,4.917"; // APP提供者提供的schema
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // ios
      const url = 'http://maps.apple.com/?ll=52.32,4.917';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw "could not lanuch $url";
      }
    }
  }
}
