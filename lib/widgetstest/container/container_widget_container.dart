import 'package:flutter/material.dart';

class ContainerWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text("Container用法展示："),
              ),
              Container(
                margin: EdgeInsets.only(top: 0.0, left: 120.0, bottom: 120.0),
                constraints: BoxConstraints.tightFor(
                  width: 200.0,
                  height: 150.0,
                ),
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                // 卡片倾斜变换
                transform: Matrix4.rotationZ(.2),
                // 卡片内文字居中
                alignment: Alignment.center,
                child: Text(
                  "5.20",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text("Padding："),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.orange,
                child: Text("Hello world"),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text("Margin："),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text("Hello world"),
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
