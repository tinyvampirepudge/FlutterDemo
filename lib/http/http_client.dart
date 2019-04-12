import 'package:dart_demo1/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class HttpClientTestRoute extends StatefulWidget {
  @override
  _HttpClientTestRouteState createState() {
    return new _HttpClientTestRouteState();
  }
}

const String lifecycleTag = 'lifecycleTag_http_client';
const String routeTag = 'routeTag_http_client';

class _HttpClientTestRouteState extends State<HttpClientTestRoute> with WidgetsBindingObserver, RouteAware {
  bool _loading = false;
  String _text = "";

  @override
  void initState() {
    super.initState();
    print('${lifecycleTag} --> initState');
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void deactivate() {
    print('${lifecycleTag} --> deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('${lifecycleTag} --> dispose');
    WidgetsBinding.instance.removeObserver(this);
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print('${lifecycleTag} --> AppLifecycleState.resumed');
        break;
      case AppLifecycleState.inactive:
        print('${lifecycleTag} --> AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
        print('${lifecycleTag} --> AppLifecycleState.paused');
        break;
      case AppLifecycleState.suspending:
        print('${lifecycleTag} --> AppLifecycleState.suspending');
        break;
      default:
        print('${lifecycleTag} --> AppLifecycleState.default');
        break;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void didPush() {
    // Route was pushed onto navigator and is now topmost route.
    print('$routeTag:didPush');
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
    print('$routeTag:didPopNext');
  }

  @override
  void didPop() {
    print('$routeTag:didPop');
    super.didPop();
  }

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
