// 基础Widgets

import 'package:dart_demo1/lifecycle/lifecycle_base.dart';
import 'package:dart_demo1/widgetstest/animation/animation_widgets.dart';
import 'package:dart_demo1/widgetstest/base/base_widgets.dart';
import 'package:dart_demo1/widgetstest/container/container_widgets.dart';
import 'package:dart_demo1/widgetstest/customwidgets/custom_widgets.dart';
import 'package:dart_demo1/widgetstest/eventhandler/event_handler_widgets.dart';
import 'package:dart_demo1/widgetstest/functional/functional_widgets.dart';
import 'package:dart_demo1/widgetstest/layout/layout_widgets.dart';
import 'package:dart_demo1/widgetstest/scroll/scroll_widgets.dart';
import 'package:flutter/material.dart';

class WidgetsTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _WidgetsTestPageState();
  }
}

class _WidgetsTestPageState extends StateWithLifecycle<WidgetsTestPage> {
  @override
  void initState() {
    state_with_lifecycle_tag = "WidgetsTestPage";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Widgets相关练习'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("基础Widgets"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new BaseWidgets();
                }));
              },
            ),
            FlatButton(
              child: Text("布局类Widgets"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new LayoutWidgets();
                }));
              },
            ),
            FlatButton(
              child: Text("容器类Widgets"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new ContainerWidgets();
                }));
              },
            ),
            FlatButton(
              child: Text("可滚动Widgets"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new ScrollWidgets();
                }));
              },
            ),
            FlatButton(
              child: Text("功能型Widgets"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new FunctionalWidgets();
                }));
              },
            ),
            FlatButton(
              child: Text("事件处理与通知"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new EventHandlerWidgets();
                }));
              },
            ),
            FlatButton(
              child: Text("动画"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new AnimationWidgets();
                }));
              },
            ),
            FlatButton(
              child: Text("自定义Widget"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new CustomWidgets();
                }));
              },
            ),
          ],
        ),
      ),
    );
    ;
  }
}
