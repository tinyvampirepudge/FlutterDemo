import 'package:flutter/material.dart';

class ButtonWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("按钮"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("RaisedButton"),
              onPressed: onRaisedButtonPressed,
            ),
            FlatButton(
              child: Text("FlatButton"),
              onPressed: onFlatButtonPressed,
            ),
            OutlineButton(
              child: Text("OutlineButton"),
              onPressed: onOutlineButtonPressed,
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: onIconButtonPressed,
            ),
            FlatButton(
              child: Text("自定义FlatButton"),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              splashColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: onCustomFlatButtonPressed,
            ),
            RaisedButton(
              child: Text("自定义RaisedButton"),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              splashColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: onCustomRaisedButtonPressed,
            ),
          ],
        ),
      ),
    );
  }

  void onRaisedButtonPressed() {
    print('默认的RaisedButton按钮被点击了');
  }

  void onFlatButtonPressed() {
    print('默认的FlatButton按钮被点击了');
  }

  void onOutlineButtonPressed() {
    print('默认的OutlineButton按钮被点击了');
  }

  void onIconButtonPressed() {
    print('默认的IconButton按钮被点击了');
  }

  void onCustomFlatButtonPressed() {
    print('自定义的FlatButton按钮被点击了');
  }

  void onCustomRaisedButtonPressed() {
    print('自定义的RaisedButton按钮被点击了');
  }
}
