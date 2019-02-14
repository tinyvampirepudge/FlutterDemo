import 'package:flutter/material.dart';

class CustomScrollViewWidgetText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 因为本路由没有使用Scaffold，为了让子级Widget使用Material Design默认的样式风格，
    // 我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          // AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Demo"),
              background: Image.asset(
                "assets/images/avatar.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  // 创建子Widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text("grid item $index"),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          // List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // 创建列表项
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text("list item $index"),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
