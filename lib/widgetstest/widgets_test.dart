// 基础Widgets

import 'package:dart_demo1/widgetstest/base/base_widgets.dart';
import 'package:flutter/material.dart';

class WidgetsTestPage extends StatelessWidget {
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
          ],
        ),
      )
    );
  }
}