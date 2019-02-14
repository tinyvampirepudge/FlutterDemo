import 'package:flutter/material.dart';

class WillPopScopeWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPoScopeTestRoute();
  }
}

class WillPoScopeTestRoute extends StatefulWidget {
  @override
  _WillPoScopeTestRouteState createState() {
    return new _WillPoScopeTestRouteState();
  }
}

class _WillPoScopeTestRouteState extends State<WillPoScopeTestRoute> {
  DateTime _lastPressedAt; // 上次点击时间

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("导航返回拦截"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        ),
      ),
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          // 两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
    );
  }
}
