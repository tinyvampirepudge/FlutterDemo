import 'package:flutter/material.dart';

const textStyle = const TextStyle(
  fontFamily: 'Raleway',
);

class TextWidgetsTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('文本及样式'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "Hello world",
            textAlign: TextAlign.center,
          ),
          Text(
            "Hello world! I'm Jack. " * 4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Hello world",
            textScaleFactor: 1.5,
          ),
          Text(
            "Hello world",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                // height：该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height。
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(text: "Home:"),
            TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(color: Colors.blue),
            )
          ])),
          DefaultTextStyle(
            // 1.设置文本默认样式
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("hello world"),
                Text("I am Jack"),
                Text(
                  "I am Jack",
                  style: TextStyle(
                      inherit: false, // 2.不继承默认样式
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            "Use the font for this text",
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
