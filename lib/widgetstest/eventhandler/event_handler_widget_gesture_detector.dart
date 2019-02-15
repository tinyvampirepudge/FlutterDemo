import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class GestureDetectorWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别GestureDetector"),
      ),
//      body: Center(
//        child: Column(
//          children: <Widget>[
//            GestureDetectorTestRoute(),
//          ],
//        ),
//      ),
//      body: _Drag(),
//      body: _DragVertical(),
//      body: _ScaleTestRoute(),
//      body: _GestureRecognizerTestRoute(),
//      body: BothDirectionTestRoute(),
      body: GestureConflictTestRoute(),
    );
  }
}

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GestureDetectorTestRouteState();
  }
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture Detected"; // 保存事件名

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 200.0,
        height: 100.0,
        child: Text(
          _operation,
          style: TextStyle(color: Colors.white),
        ),
      ),
      onTap: () => updateText("Tap"), // 点击
      onDoubleTap: () => updateText("DoubleTap"), // 双击
      onLongPress: () => updateText("LongPress"), // 长按
    );
  }

  updateText(String s) {
    // 更新显示的事件名
    setState(() {
      _operation = s;
    });
  }
}

/// 拖动圆形字母A的示例
class _Drag extends StatefulWidget {
  @override
  _DragState createState() {
    return new _DragState();
  }
}

class _DragState extends State<_Drag> {
  double _top = 0.0; // 距顶部的偏移
  double _left = 0.0; // 距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            // 手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              // 打印手指按下的位置（相对于屏幕）
              print("用户手指按下：${e.globalPosition}");
            },
            // 手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              // 用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              // 打印滑动结束时在x、y轴上的速度
              print("onPanEnd:${e.velocity}");
            },
          ),
        )
      ],
    );
  }
}

/// 只能沿垂直方向拖动
class _DragVertical extends StatefulWidget {
  @override
  _DragVerticalState createState() {
    return new _DragVerticalState();
  }
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("B"),
            ),
            // 垂直方向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            },
          ),
        )
      ],
    );
  }
}

/// 缩放
class _ScaleTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ScaleTestRouteState();
  }
}

class _ScaleTestRouteState extends State<_ScaleTestRoute> {
  double _width = 200.0; // 通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset("assets/images/avatar.jpeg", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            _width = 200 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}

/// GestureRecognizer
/// 给一段富文本（RichText）的不同部分分别添加点击事件处理器
class _GestureRecognizerTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GestureRecognizerTestRouteState();
  }
}

class _GestureRecognizerTestRouteState
    extends State<_GestureRecognizerTestRoute> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; // 变色开关
  @override
  void dispose() {
    // 用到gestureRecognizer的话一定要调用其dispose方法释放资源。
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(children: [
          TextSpan(text: "你好世界"),
          TextSpan(
            text: "点我变色",
            style: TextStyle(
              fontSize: 30.0,
              color: _toggle ? Colors.blue : Colors.red,
            ),
            recognizer: _tapGestureRecognizer
              ..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              },
          ),
          TextSpan(text: "你好世界"),
        ]),
      ),
    );
  }
}

/// 手势竞争
class BothDirectionTestRoute extends StatefulWidget {
  @override
  _BothDirectionTestRouteState createState() {
    return new _BothDirectionTestRouteState();
  }
}

class _BothDirectionTestRouteState extends State<BothDirectionTestRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            //垂直方向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            },
            //水平方向拖动事件
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
              });
            },
          ),
        ),
      ],
    );
  }
}

/// 手势冲突
class GestureConflictTestRoute extends StatefulWidget {
  @override
  _GestureConflictTestRouteState createState() {
    return new _GestureConflictTestRouteState();
  }
}

class _GestureConflictTestRouteState extends State<GestureConflictTestRoute> {
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
              });
            },
            onHorizontalDragEnd: (details) {
              print('onHorizontalDragEnd');
            },
            onTapDown: (details) {
              print('onTapDown');
            },
            onTapUp: (details) {
              print('onTapUp');
            },
          ),
        )
      ],
    );
  }
}
