import 'package:flutter/material.dart';

class NotificationWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("通知Notification"),
      ),
//      body: NotificationListener1(),
      body: NotificationRoute(),
    );
  }
}

/// 监听Scrollable Widget滚动通知
class NotificationListener1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        switch (notification.runtimeType) {
          case ScrollStartNotification:
            print('开始滚动');
            break;
          case ScrollUpdateNotification:
            print('正在滚动');
            break;
          case ScrollEndNotification:
            print('滚动停止');
            break;
          case OverscrollIndicatorNotification:
            print('滚动到边界');
            break;
        }
      },
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        },
      ),
    );
  }
}

// 自定义通知
class MyNotification extends Notification {
  final String msg;

  MyNotification(this.msg);
}

class NotificationRoute extends StatefulWidget {
  @override
  _NotificationRouteState createState() {
    return new _NotificationRouteState();
  }
}

class _NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    // 监听通知
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + "  ";
        });
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(
              builder: (context) {
                return RaisedButton(
                  // 点击按钮时分发通知
                  onPressed: () => MyNotification("Hi").dispatch(context),
                  child: Text("Send Notification"),
                );
              },
            ),
            Text(_msg),
          ],
        ),
      ),
    );
  }
}
