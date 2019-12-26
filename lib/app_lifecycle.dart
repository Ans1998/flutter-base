import 'package:flutter/material.dart';

// flutter应用维度生命周期
// WidgetsBindingObserver：是一个Widgets绑定观察器，通过它我们可以监听应用的生命周期、语言等的变化
class AppLifecyclePage extends StatefulWidget {
  @override
  _AppLifecyclePageState createState() => _AppLifecyclePageState();
}

class _AppLifecyclePageState extends State<AppLifecyclePage> with WidgetsBindingObserver {
  
  @override
  void initState() {
    // 注册监听器
    WidgetsBinding.instance.addObserver(this);
    // 父类调用initState()
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter应用生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('Flutter应用生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 调用父类 didChangeAppLifecycleState()
    super.didChangeAppLifecycleState(state);

    print('state = $state');

    if (state == AppLifecycleState.paused) {
      print('App进入后台');
    }
    else if (state == AppLifecycleState.resumed) {
      print('App进去前台');
    }
    else if (state == AppLifecycleState.inactive) {
      //不常用：应用程序处于非活动状态，并且未接收用户输入时调用，比如：来了个电话
    }
    else if (state == AppLifecycleState.detached) {
      //不常用：应用程序卸载的时候调用
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

}
