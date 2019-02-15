import 'package:dart_demo1/widgetstest/eventhandler/event_handler_widget_eventbus_a.dart';
import 'package:flutter/material.dart';
import 'package:dart_demo1/widgetstest/eventhandler/eventbus.dart';

class EventBusWidgetTestB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _EventBusWidgetTestBState();
  }
}

class _EventBusWidgetTestBState extends State<EventBusWidgetTestB> {
  @override
  void initState() {
    super.initState();
    bus.on("login", (arg) {
      print('arg:${arg}');
    });
  }

  @override
  void dispose() {
    bus.off("login");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBus测试-监听登录事件"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("监听登录事件"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                      return new EventBusWidgetTestA();
                    }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
