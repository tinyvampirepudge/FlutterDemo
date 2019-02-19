import 'package:dart_demo1/http/http_client.dart';
import 'package:dart_demo1/http/http_dio.dart';
import 'package:dart_demo1/http/http_json_model.dart';
import 'package:dart_demo1/http/http_socket.dart';
import 'package:dart_demo1/http/http_web_socket.dart';
import 'package:flutter/material.dart';

class HttpRouteText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpClient"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Http请求——HttpClient"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new HttpClientTestRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("Http请求——Dio package"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new HttpDioRouteText();
                }));
              },
            ),
            RaisedButton(
              child: Text("WebSocket"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new WebSocketRouteTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("Socket"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new SocketRouteTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("JsonModel"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new JsonModelRouteTest();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
