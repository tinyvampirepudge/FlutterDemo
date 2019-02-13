import 'package:flutter/material.dart';

class SizedBoxWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('SizedBox'),
      ),
      body: SizedBox(
        width: 80.0,
        height: 80.0,
        child: redBox,
      ),
    );
  }
}
