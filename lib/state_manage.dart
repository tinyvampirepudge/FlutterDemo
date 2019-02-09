/// 状态管理

import 'package:flutter/material.dart';
import 'tapboxa.dart';
import 'tapboxb.dart';

class StateManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Widget管理自身状态"),
                textColor: Colors.blue,
                color: Colors.black,
                onPressed: () {
                  // 导航到新路由
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new TapbpxAPage();
                  }));
                },
              ),
              FlatButton(
                child: Text("父widget管理子widget的state"),
                textColor: Colors.blue,
                color: Colors.black,
                onPressed: () {
                  // 导航到新路由
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new TapboxBPage();
                      }));
                },
              ),
              FlatButton(
                child: Text("混合管理"),
                textColor: Colors.blue,
                color: Colors.black,
                onPressed: () {
                  // 导航到新路由
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new TapbpxAPage();
                      }));
                },
              ),
            ]),
      ),
    );
  }
}
