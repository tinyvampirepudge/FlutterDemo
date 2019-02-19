import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class SocketRouteTest extends StatefulWidget {
  @override
  _SocketRouteTestRoute createState() {
    return new _SocketRouteTestRoute();
  }
}

class _SocketRouteTestRoute extends State<SocketRouteTest> {
  String _response = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("访问百度"),
              onPressed: () async {
                // 建立连接
                var socket = await Socket.connect("baidu.com", 80);
                // 根据http协议，发送请求头
                socket.writeln("GET / HTTP/1.1");
                socket.writeln("Host:baidu.com");
                socket.writeln("Connection:close");
                socket.writeln();
                await socket.flush(); // 发送
                // 读取返回内容
                String response = await socket.transform(utf8.decoder).join();
                setState(() {
                  _response = response;
                });
                await socket.close();
              },
            ),
            Padding(
              child: Text(_response),
              padding: EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
