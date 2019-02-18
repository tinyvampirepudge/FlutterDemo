import 'package:flutter/material.dart';

class CustomPageSwitchAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义路由过渡动画"),
      ),
    );
  }
}

class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.opaque = true,
    this.barrierDismissible = false,
  });

  final WidgetBuilder builder;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  // TODO: implement barrierColor
  Color get barrierColor => null;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}
