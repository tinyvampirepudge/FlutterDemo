import 'package:dart_demo1/widgetstest/customwidgets/custom_widget_gradient_circular_progress.dart';
import 'package:dart_demo1/widgetstest/customwidgets/custom_widget_group.dart';
import 'package:dart_demo1/widgetstest/customwidgets/custom_widget_paint_canvas.dart';
import 'package:dart_demo1/widgetstest/customwidgets/custom_widget_turn_box.dart';
import 'package:flutter/material.dart';

class CustomWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义Widget"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("组合Widget"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new GroupWidgetTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("TurnBox"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new TurnBoxWidgetTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("CustomPaint与Canvas"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new CustomPaintWidgetTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("圆形渐变进度条(自绘)"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new GradientCircularProgressRoute();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
