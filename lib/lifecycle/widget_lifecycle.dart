import 'package:dart_demo1/http/http_client.dart';
import 'package:flutter/material.dart';

const String lifecycleTag = 'lifecycleTag';

class WidgetLifecycle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget的生命周期"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Http请求——HttpClient"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new HttpClientTestRoute();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    print('${lifecycleTag} --> initState');
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    print('${lifecycleTag} --> dispose');
    WidgetsBinding.instance.removeObserver(this);
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

}
