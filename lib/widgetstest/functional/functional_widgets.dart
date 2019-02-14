import 'package:dart_demo1/widgetstest/functional/functional_widget_will_pop_scope.dart';
import 'package:flutter/material.dart';

class FunctionalWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能型Widgets"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("导航返回拦截-WillPopScope"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new WillPopScopeWidgetTest();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
