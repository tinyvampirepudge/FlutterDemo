import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class BatteryLevelRouteTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("获取电池电量"),
      ),
      body: BatteryLevelWidget(),
    );
  }
}

class BatteryLevelWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BatteryLevelWidgetState();
  }
}

class _BatteryLevelWidgetState extends State<BatteryLevelWidget> {
  static const platform = const MethodChannel("com.example.dartdemo1/battery");

  // Get battery level.
  String _batteryLevel = "Unknown battery level.";

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            child: Text("Get Battery Level"),
            onPressed: _getBatteryLevel,
          ),
          Text(_batteryLevel),
        ],
      ),
    );
  }
}
