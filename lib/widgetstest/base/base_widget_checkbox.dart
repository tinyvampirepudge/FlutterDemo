import 'package:flutter/material.dart';

class TestWidgetCheckBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("单选开关和复选框"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SwitchAndCheckBoxTestRoute(),
          ],
        ),
      ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() {
    return new _SwitchAndCheckBoxTestRouteState();
  }
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true;// 维护单选开关状态
  bool _checkboxSelected = true;// 维护复选框状态

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          onChanged: (value){
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,
          onChanged: (value){
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}
