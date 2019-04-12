import 'package:dart_demo1/main.dart';
import 'package:flutter/material.dart';


abstract class StateWithLifecycle<T extends StatefulWidget> extends State with WidgetsBindingObserver, RouteAware {
  String state_with_lifecycle_tag = 'lifecycleTag';


  bool _isVisiableToUser = false; // 是否对用户可见，表明在onResume-onPause调用过程中。

  bool _didPush = false; // 表示是否调用了didPush方法。第一次进入会调用
  bool _didPopNext = false; // 表示是否调用了didPopNext方法。进入别的页面，再次返回时会调用。
  bool _didPop = false; // 表示是否调用了didPop方法。从Navigator中pop时会调用。

  @override
  void initState() {
    super.initState();
    debugPrint('${state_with_lifecycle_tag} --> initState');
    onMockCreate();
    onMockResume();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void deactivate() {
    debugPrint('${state_with_lifecycle_tag} --> deactivate');
    debugPrint('${state_with_lifecycle_tag} _didPush --> $_didPush');
    debugPrint('${state_with_lifecycle_tag} _didPop --> $_didPop');
    debugPrint('${state_with_lifecycle_tag} _didPopNext --> $_didPopNext');
    super.deactivate();
    if (_didPop || _didPush) {
      onMockPause();
    } else if (_didPopNext) {
      onMockResume();
    }
    _resetValues();
  }

  /// 重置这三个变量
  void _resetValues() {
    _didPop = false;
    _didPopNext = false;
    _didPush = false;
  }

  @override
  void dispose() {
    debugPrint('${state_with_lifecycle_tag} --> dispose');
    onMockDestroy();
    WidgetsBinding.instance.removeObserver(this);
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
//        debugPrint('${lifecycleTag} --> AppLifecycleState.resumed');
        break;
      case AppLifecycleState.inactive:
//        debugPrint('${lifecycleTag} --> AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
//        debugPrint('${lifecycleTag} --> AppLifecycleState.paused');
        break;
      case AppLifecycleState.suspending:
//        debugPrint('${lifecycleTag} --> AppLifecycleState.suspending');
        break;
      default:
//        debugPrint('${lifecycleTag} --> AppLifecycleState.default');
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
    debugPrint('$state_with_lifecycle_tag:didPush');
    _didPush = true;
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
    debugPrint('$state_with_lifecycle_tag:didPopNext');
    _didPopNext = true;
  }

  @override
  void didPop() {
    debugPrint('$state_with_lifecycle_tag:didPop');
    _didPop = true;
  }

  /// 页面初始化调用，只会调用一次。参照Android端Activity#onCreate方法。
  void onMockCreate() {
    debugPrint("$state_with_lifecycle_tag:onMockCreate");
  }

  /// 页面由不可见变为可见时调用。
  void onMockResume() {
    debugPrint("$state_with_lifecycle_tag:onMockResume");
    _isVisiableToUser = true;
  }

  /// 页面有可见变为不可见时调用。
  void onMockPause() {
    debugPrint("$state_with_lifecycle_tag:onMockPause");
  }

  /// 页面销毁时调用。
  void onMockDestroy() {
    debugPrint("$state_with_lifecycle_tag:onMockDestroy");
    _isVisiableToUser = false;
  }
}
