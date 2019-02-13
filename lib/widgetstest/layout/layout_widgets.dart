import 'package:dart_demo1/widgetstest/layout/layout_widget_column.dart';
import 'package:dart_demo1/widgetstest/layout/layout_widget_row.dart';
import 'package:flutter/material.dart';

class LayoutWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局类Widgets"),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("线性布局Row"),
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  // 导航到新路由
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new RowWidgetTest();
                  }));
                },
              ),
              RaisedButton(
                child: Text("线性布局Column"),
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  // 导航到新路由
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new RowColumnWidgetTest();
                  }));
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
