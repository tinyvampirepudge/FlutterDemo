import 'package:flutter/material.dart';
import 'dart:math';

class TransformWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("trandform变换"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text("沿Y轴倾斜0.3弧度："),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 100.0),
                  color: Colors.black,
                  child: new Transform(
                    alignment: Alignment.topRight,
                    transform: new Matrix4.skewY(0.3),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.deepOrange,
                      child: const Text("Apartment for rent!"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    "平移：",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  // 默认远点为左上角，左移20像素，向上平移5像素
                  child: Transform.translate(
                    offset: Offset(-20.0, -5.0),
                    child: Text("Hello world"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    "旋转：",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  height: 200.0,
                  width: 200.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Text("Hello world"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    "缩放：",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 1.5, // 放大到1.5倍
                    child: Text("Hello world"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text(
                    "Transform变换只针对绘制阶段，不会影响layout：",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Transform.scale(
                        scale: 1.5,
                        child: Text("Hello world"),
                      ),
                    ),
                    Text(
                      "你好",
                      style: TextStyle(color: Colors.green, fontSize: 18.0),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text(
                    "RotatedBox:",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text("Hello world"),
                      ),
                    ),
                    Text(
                      "你好",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
