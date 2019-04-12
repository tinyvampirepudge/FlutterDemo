//继承NavigatorObserver
import 'package:flutter/widgets.dart';

class CustomNavigatorObserver extends NavigatorObserver{
  @override
  void didPush(Route route, Route previousRoute) {
    // 当调用Navigator.push时回调
    super.didPush(route, previousRoute);
    //可通过route.settings获取路由相关内容
    //route.currentResult获取返回内容
    //....等等
    print('CustomNavigatorObserver didPush route:${route.settings.name} , previousRoute:${previousRoute?.settings?.name}');
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    print('CustomNavigatorObserver didPop route:${route.settings.name} , previousRoute:${previousRoute?.settings?.name}');
  }
}