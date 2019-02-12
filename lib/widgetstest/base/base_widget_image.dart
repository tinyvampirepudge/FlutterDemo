import 'package:flutter/material.dart';

class ImageWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
    // accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
    // error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
    // fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return new Scaffold(
        appBar: new AppBar(
          title: Text("图片及Icon"),
        ),
        body: Scrollbar(
            child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "从assets文件夹加载图片：assets/images/avatar.jpeg",
                ),
                Container(
                  child: Image(
                    image: AssetImage("assets/images/avatar.jpeg"),
                    height: 200.0,
                  ),
                  margin: EdgeInsets.all(10.0),
                ),
                Container(
                  child: Image.asset(
                    "assets/images/avatar.jpeg",
                    height: 200.0,
                  ),
                  margin: EdgeInsets.all(10.0),
                ),
                Text(
                  "加载网络图片：",
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Image(
                    image: NetworkImage(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                    ),
                    width: 100.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Image.network(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                    width: 100.0,
                  ),
                ),
                Container(
                  child: Text(
                    "ICON：",
                  ),
                  margin: EdgeInsets.only(
                      left: 10.0, top: 20.0, right: 10.0, bottom: 10.0),
                ),
                Container(
                  child: Text(
                    icons,
                    style: TextStyle(
                      fontFamily: "MaterialIcons",
                      fontSize: 24.0,
                      color: Colors.green,
                    ),
                  ),
                  margin: EdgeInsets.all(10.0),
                ),
                Text(
                  "使用IconData和Icon显示字体图标:",
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.accessible,
                        color: Colors.green,
                      ),
                      Icon(
                        Icons.error,
                        color: Colors.green,
                      ),
                      Icon(
                        Icons.fingerprint,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                Text(
                  "使用自定义字体图标:",
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        MyIcons.dollar,
                        color: Colors.purple,
                      ),
                      Icon(
                        MyIcons.wechat,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}

class MyIcons {
  static const IconData dollar = const IconData(
    0xe620,
    fontFamily: "MyIcon",
    matchTextDirection: true,
  );
  static const IconData wechat = const IconData(
    0xe77d,
    fontFamily: "MyIcon",
    matchTextDirection: true,
  );
}
