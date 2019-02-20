import 'package:flutter/material.dart';

class CustomUIFrameworkRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义UI框架"),
      ),
      body: CustomHome(),
    );
  }
}

class HomeView extends ComponentElement {
  HomeView(Widget widget) : super(widget);
  String text = "123456789";

  @override
  Widget build() {
    Color primary = Theme.of(this).primaryColor;
    return GestureDetector(
      child: Center(
        child: FlatButton(
          child: Text(
            text,
            style: TextStyle(color: primary),
          ),
          onPressed: () {
            var t = text.split("")..shuffle();
            text = t.join();
            markNeedsBuild();
          },
        ),
      ),
    );
  }
}

class CustomHome extends Widget {
  @override
  Element createElement() {
    return HomeView(this);
  }
}
