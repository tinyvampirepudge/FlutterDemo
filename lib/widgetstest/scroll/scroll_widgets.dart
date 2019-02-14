import 'package:dart_demo1/widgetstest/scroll/scroll_widget_listview.dart';
import 'package:dart_demo1/widgetstest/scroll/scroll_widget_single_child_scroll_view.dart';
import 'package:flutter/material.dart';

class ScrollWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可滚动的Widgets"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("SingleChildScrollView"),
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    // 导航到新路由
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new SingleChildScrollViewWidgetTest();
                    }));
                  },
                ),
                RaisedButton(
                  child: Text("ListView"),
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    // 导航到新路由
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new ListViewWidgetTest();
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
