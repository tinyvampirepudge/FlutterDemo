import 'package:flutter/material.dart';

class RowColumnWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局Column"),
      ),
      body: Container(
          color: Colors.green,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max, // 有效，外层Column高度为整个屏幕
              children: <Widget>[
                Expanded(// 如果要让里面的Column占满外部的Column，可以使用Expanded widget。
                  child: Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max, // 无效，内层Column高度为实际高度
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("hello world "),
                        Text("I am Jack "),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
