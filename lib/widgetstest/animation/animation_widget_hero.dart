import 'package:dart_demo1/widgetstest/animation/animation_widget_hero_b.dart';
import 'package:flutter/material.dart';

class HeroWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero1"),
      ),
      body: Container(
          alignment: Alignment.topCenter,
          child: InkWell(
            child: Hero(
              tag: "avatar", // 唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipOval(
                child: Image.asset(
                  "assets/images/avatar.jpeg",
                  width: 100.0,
                ),
              ),
            ),
            onTap: () {
              // 打开路由B
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
                  return new FadeTransition(
                    opacity: animation,
                    child: HeroBWidgetTest(),
                  );
                },
              ));
            },
          )),
    );
  }
}
