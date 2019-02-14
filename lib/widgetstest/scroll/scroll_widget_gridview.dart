import 'package:flutter/material.dart';

class GridViewWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
//      body: GridView1(),
//      body: GridView2(),
//      body: GridView3(),
//      body: GridView4(),
      body: InfiniteGridView(),
    );
  }
}

/// SliverGridDelegateWithFixedCrossAxisCount
class GridView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 横轴三个子Widget
        childAspectRatio: 1.0, // 宽高比为1时，子Widget
      ),
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

/// GridView.count 等价于GridView1
class GridView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // 横轴三个子Widget
      childAspectRatio: 1.0, // 宽高比为1时，子Widget
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

/// SliverGridDelegateWithMaxCrossAxisExtent
class GridView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120.0,
        childAspectRatio: 2.0,
      ),
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

/// GridView.extent 等价于GridView3
class GridView4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 120.0,
      childAspectRatio: 2.0,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

/// 无限更新的GridView
class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = []; // 保存Icon数据

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
      ),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        // 如果显示到最后一个并且Icon总数小于200时继续获取数据
        if (index == _icons.length - 1 && _icons.length < 200) {
          _retrieveIcons();
        }
        return Icon(_icons[index]);
      },
    );
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }
}
