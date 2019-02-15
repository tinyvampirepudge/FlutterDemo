import 'package:flutter/material.dart';

class PointerEventWidgetTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PointerEventWidgetTestState();
}

class _PointerEventWidgetTestState extends State<PointerEventWidgetTest> {
  // 定义一个状态，保存当前指针位置。
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pointer事件处理"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Listener(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 300.0,
                height: 150.0,
                child: Text(
                  _event.toString() ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPointerDown: (PointerDownEvent event) =>
                  setState(() => _event = event),
              onPointerMove: (PointerMoveEvent event) =>
                  setState(() => _event = event),
              onPointerUp: (PointerUpEvent event) =>
                  setState(() => _event = event),
            ),
          ],
        ),
      ),
    );
  }
}
