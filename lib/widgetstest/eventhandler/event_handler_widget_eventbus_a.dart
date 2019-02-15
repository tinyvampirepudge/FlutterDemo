import 'package:flutter/material.dart';
import 'package:dart_demo1/widgetstest/eventhandler/eventbus.dart';

class EventBusWidgetTestA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBus测试-发送登录事件"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("发送登录事件"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                bus.emit(
                  "login",
                  "猫了个咪啊",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
