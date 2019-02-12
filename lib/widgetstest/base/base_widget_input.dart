import 'package:flutter/material.dart';

class InputWidgetTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("输入框及表单"),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
              child: Center(
            child: Column(
              children: <Widget>[
//              InputWidgetTest(),
                FocusTestRoute(),
              ],
            ),
          )),
        ));
  }
}

class InputWidgetTest extends StatefulWidget {
  @override
  _InputWidgetTestState createState() => _InputWidgetTestState();
}

class _InputWidgetTestState extends State<InputWidgetTest> {
  // 定义一个controller
  TextEditingController _unameController = new TextEditingController();

  TextEditingController _selectionController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    // 监听输入改变
    _unameController.addListener(() {
      print("_unameController.addListener:" + _unameController.text);
    });

    // 设置默认值，并从第三个字符开始选中后面的字符
    _selectionController.text = "hello world!";
    _selectionController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _selectionController.text.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("登录输入框"),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person),
                  ),
                  controller: _unameController,
                  onChanged: (v) {
                    print("onChanged:$v");
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  controller: _selectionController,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FocusTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text("控制焦点"),
          ),
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(
              labelText: "input1",
              prefixIcon: Icon(Icons.fingerprint),
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
              labelText: "input2",
              prefixIcon: Icon(Icons.linked_camera),
            ),
          ),
          Builder(
            builder: (context) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      // 将焦点从第一个TextField移到第二个TextField
                      // 这是第一种写法
//                      FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if (null == focusScopeNode) {
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode2);
                    },
                  ),
                  RaisedButton(
                      child: Text("隐藏键盘"),
                      onPressed: () {
                        // 当所有编辑框都是去焦点时键盘就会收起
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                      }),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
