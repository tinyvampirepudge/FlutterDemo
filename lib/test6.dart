import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
 *登录页
 */
class CheckBookLoginPage extends StatefulWidget {
  CheckBookLoginPage({Key key}) : super(key: key);

  @override
  _CheckBookLoginPage createState() => _CheckBookLoginPage();
}

class _CheckBookLoginPage extends State<CheckBookLoginPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: undefined_method
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 16, top: 34, right: 16, bottom: 16),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/icon_close.png',
                height: 16,
                width: 16,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 40, right: 40),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '手机号登录/注册',
                          style: TextStyle(fontSize: 26),
                        ),
                        Padding(padding: EdgeInsets.only(top: 4)),
                        Text(
                          '欢迎来到麻袋财富',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40)),
                  buildPhoneTextField(context),
                  Divider(height: 1, color: Colors.grey[400]),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  buildProtocol(context),
                  Padding(padding: EdgeInsets.only(top: 55)),
                  buildButton(context),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    "未注册的手机号码验证后自动注册",
                    style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text("我是占位符"),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "市场有风险,出借需谨慎",
                    style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                  ),
                  Text(
                    "上海凯岸信息科技有限公司",
                    style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildPhoneTextField(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 14, color: Colors.black),
      decoration: InputDecoration(border: InputBorder.none, hintText: "请输入手机号", hintStyle: TextStyle(color: Colors.grey[400])),
    );
  }

  Row buildProtocol(BuildContext context) {
    bool _checkboxSelected = false;
    return Row(
      children: <Widget>[
//        GestureDetector(
//          onTap: () {
//            if (_checkboxSelected) {
//              Image.asset('assets/icons/icon_choice_unchecked.png');
//              _checkboxSelected = false;
//            } else {
//              Image.asset('assets/icons/icon_choice_checked.png.png');
//              _checkboxSelected = true;
//            }
//          },
//          child: Image.asset('assets/icons/icon_choice_unchecked.png'),
//        ),
        Text(
          "已阅读并同意",
          style: TextStyle(fontSize: 11, color: Colors.grey[400]),
        ),
        GestureDetector(
            onTap: () {},
            child: Text(
              "《麻袋财富注册协议》",
              style: TextStyle(fontSize: 11, color: Colors.grey[400]),
            )),
      ],
    );
  }

  Container buildButton(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
          color: Color(0xffFD5746),
          disabledColor: Color(0xffF5B2AB),
          textColor: Colors.white,
          disabledElevation: 0,
          elevation: 0,
          child: new Text('下一步'),
          onPressed: () {},
        ));
  }

  //登录
  void login() {}
}
