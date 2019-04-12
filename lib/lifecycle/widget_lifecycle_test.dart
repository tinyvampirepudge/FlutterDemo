import 'package:dart_demo1/main.dart';
import 'package:flutter/material.dart';

const String lifecycleTag = 'lifecycleTag_lifecycle';
const String routeTag = 'routeTag_lifecycle';

class WidgetLifecycle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> with WidgetsBindingObserver, RouteAware {
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
                Navigator.pushNamed(context, "http_client");
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
  void deactivate() {
    print('${lifecycleTag} --> deactivate');
    var lifecycleRoute = ModalRoute.of(context).settings.name;
//    print('lifecycleRoute:$lifecycleRoute');
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
}
