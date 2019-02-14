import 'package:dart_demo1/widgetstest/container/container_widget_constrained_box.dart';
import 'package:dart_demo1/widgetstest/container/container_widget_container.dart';
import 'package:dart_demo1/widgetstest/container/container_widget_decorated_box.dart';
import 'package:dart_demo1/widgetstest/container/container_widget_padding.dart';
import 'package:dart_demo1/widgetstest/container/container_widget_scaffold.dart';
import 'package:dart_demo1/widgetstest/container/container_widget_sized_box.dart';
import 'package:dart_demo1/widgetstest/container/container_widget_transform.dart';
import 'package:flutter/material.dart';

class ContainerWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("容器类Widget"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Padding"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new PaddingWidgetTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("ConstrainedBox"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ConstrainedBoxWidgetTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("SizedBox"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new SizedBoxWidgetTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("DecoratedBox"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new DecoratedBoxWidgetText();
                }));
              },
            ),
            RaisedButton(
              child: Text("Transform"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new TransformWidgetTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("Container"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ContainerWidgetTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("Scaffold、TabBar、底部导航"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ScaffoldWidgetTest();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
