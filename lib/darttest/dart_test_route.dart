import 'package:flutter/material.dart';

class DartTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart学习"),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("变量声明"),
                onPressed: () {
                  // 导航到新路由
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new DartTestRoute();
                  }));
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
