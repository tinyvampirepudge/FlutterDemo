import 'dart:async';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
//      body: ListView1(),
//      body: ListView2(),
//      body: ListView3(),
      body: InfiniteListView(),
    );
  }
}

/// 默认构造函数
class ListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        const Text('I\'m dedicating every day to you'),
        const Text('Domestic life was never quite my style'),
        const Text('When you smile, you knock me out, I fall apart'),
        const Text('And I thought I was so smart'),
      ],
    );
  }
}

/// ListView.builder
class ListView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: 80,
      itemExtent: 50.0, // 强制高度为50.0
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("$index"),
        );
      },
    );
  }
}

/// ListView.separated
class ListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 下划线widget预定义供复用
    Widget divider1 = new Divider(color: Colors.blue);
    Widget divider2 = new Divider(color: Colors.green);
    return ListView.separated(
      // 列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      // 分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
      itemCount: 100,
    );
  }
}

/// 无限加载列表
class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; // 表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("商品列表"),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: _words.length,
            itemBuilder: (context, index) {
              // 如果到了表尾
              if (_words[index] == loadingTag) {
                // 不足一百条数据，继续获取数据
                if (_words.length - 1 < 100) {
                  // 获取数据
                  _retrieveData();
                  // 加载时显示loading
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    ),
                  );
                } else {
                  // 已经加载了100条数据，不再获取数据
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "没有更多了",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
              }
              // 显示单词列表项
              return ListTile(
                title: Text(_words[index]),
              );
            },
            separatorBuilder: (context, index) => Divider(height: .0),
          ),
        ),
      ],
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        // 重新构建列表
      });
    });
  }
}
