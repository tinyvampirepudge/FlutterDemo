import 'package:dart_demo1/widgetstest/animation/animation_widget_hero.dart';
import 'package:dart_demo1/widgetstest/animation/animation_widget_route_switch.dart';
import 'package:dart_demo1/widgetstest/animation/animation_widget_scale.dart';
import 'package:dart_demo1/widgetstest/animation/animation_widget_stagger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnimationWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("动画结构"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ScaleAnimationRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("自定义路由过渡动画"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                // ios切换路由
//                Navigator.push(context,
//                    new CupertinoPageRoute(builder: (context) {
//                  return new CustomPageSwitchAnimationRoute();
//                }));


//                Navigator.push(
//                    context,
//                    PageRouteBuilder(
//                      transitionDuration: Duration(milliseconds: 500),
//                      pageBuilder: (BuildContext context, Animation animation,
//                          Animation secondaryAnimation) {
//                        return new FadeTransition(
//                          opacity: animation,
//                          child: CustomPageSwitchAnimationRoute(),
//                        );
//                      },
//                    ));

                Navigator.push(context, FadeRoute(builder: (context) {
                  return CustomPageSwitchAnimationRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("Hero动画"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new HeroWidgetTest();
                }));
              },
            ),
            RaisedButton(
              child: Text("交错动画"),
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new StaggerDemo();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
