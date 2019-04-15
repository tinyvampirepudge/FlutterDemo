import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class HttpClientTestRoute extends StatefulWidget {
  @override
  _HttpClientTestRouteState createState() {
    return new _HttpClientTestRouteState();
  }
}

class _HttpClientTestRouteState extends State<HttpClientTestRoute> with WidgetsBindingObserver, RouteAware {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpClient Test"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("获取百度首页"),
                onPressed: _loading
                    ? null
                    : () async {
                        setState(() {
                          _loading = true;
                          _text = "正在请求";
                        });

                        try {
                          // 创建一个HttpClient
                          HttpClient httpClient = new HttpClient();
                          // 打开http链接
                          HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
                          // 使用IPhone的UA
                          request.headers.add("user-agent",
                              "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                          // 等待链接服务器（会将请求信息发送给服务器）
                          HttpClientResponse response = await request.close();
                          // 读取相应内容
                          _text = await response.transform(utf8.decoder).join();
                          // 输出响应头
                          print(response.headers);

                          // 关闭client后，通过该client发起的所有请求都会中止
                          httpClient.close();
                        } catch (e) {
                          _text = "请求失败：$e";
                        } finally {
                          setState(() {
                            _loading = false;
                          });
                        }
                      },
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(_text.replaceAll(new RegExp(r"\s"), "")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
