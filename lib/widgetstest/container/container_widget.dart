import 'package:dart_demo1/widgetstest/container/container_widget_padding.dart';
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
          ],
        ),
      ),
    );
  }
}
