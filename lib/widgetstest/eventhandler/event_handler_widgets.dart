import 'package:dart_demo1/widgetstest/eventhandler/event_handler_widget_eventbus_a.dart';
import 'package:dart_demo1/widgetstest/eventhandler/event_handler_widget_eventbus_b.dart';
import 'package:dart_demo1/widgetstest/eventhandler/event_handler_widget_gesture_detector.dart';
import 'package:dart_demo1/widgetstest/eventhandler/event_handler_widget_notification.dart';
import 'package:dart_demo1/widgetstest/eventhandler/event_handler_widget_pointer.dart';
import 'package:flutter/material.dart';

class EventHandlerWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理与通知"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("原始指针事件处理"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new PointerEventWidgetTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("手势识别GestureDetector"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new GestureDetectorWidgetTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("全局事件总线——发送消息"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new EventBusWidgetTestA();
                }));
              },
            ),
            RaisedButton(
              child: Text("全局事件总线——接收消息"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new EventBusWidgetTestB();
                }));
              },
            ),
            RaisedButton(
              child: Text("通知——Notification"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new NotificationWidgetTest();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
