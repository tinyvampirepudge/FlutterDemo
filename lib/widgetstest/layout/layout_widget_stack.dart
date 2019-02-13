import 'package:flutter/material.dart';

class StackWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局Stack"),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            width: 200.0,
            height: 200.0,
            color: Colors.red,
          ),
          Container(
            width: 150.0,
            height: 150.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
