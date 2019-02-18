import 'package:flutter/material.dart';

class HeroBWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("原图"),
      ),
      body: Center(
        child: Hero(
          tag: "avatar",
          child: Image.asset("assets/images/avatar.jpeg"),
        ),
      ),
    );
  }
}
