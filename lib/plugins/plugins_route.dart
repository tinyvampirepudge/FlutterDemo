import 'package:dart_demo1/plugins/plugin_battery_level.dart';
import 'package:flutter/material.dart';

class PluginsRouteText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("插件开发"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("获取电池电量"),
              padding: const EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new BatteryLevelRouteTest();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
