import 'package:flutter/material.dart';

class WidgetLifecycle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> with WidgetsBindingObserver, RouteAware {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget的生命周期"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Http请求——HttpClient"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.pushNamed(context, "http_client");
              },
            ),
          ],
        ),
      ),
    );
  }
}
