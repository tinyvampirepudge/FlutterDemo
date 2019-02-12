import 'package:dart_demo1/widgetstest/base/base_widget_button.dart';
import 'package:dart_demo1/widgetstest/base/base_widget_checkbox.dart';
import 'package:dart_demo1/widgetstest/base/base_widget_image.dart';
import 'package:dart_demo1/widgetstest/base/base_widget_text.dart';
import 'package:flutter/material.dart';

class BaseWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('基础Widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("文字、字体样式"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new TextWidgetsTest();
                }));
              },
            ),
            FlatButton(
              child: Text("按钮"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ButtonWidgetTest();
                }));
              },
            ),
            FlatButton(
              child: Text("图片及Icon"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ImageWidgetTest();
                }));
              },
            ),
            FlatButton(
              child: Text("单选开关和复选框"),
              padding: const EdgeInsets.all(10.0),
              textColor: Colors.blue,
              color: Colors.black,
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                      return new TestWidgetCheckBox();
                    }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
