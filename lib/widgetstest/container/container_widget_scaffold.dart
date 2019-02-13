import 'package:flutter/material.dart';

class ScaffoldWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldRoute();
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;

  // 需要定义一个Controller
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          print('0');
          break;
        case 1:
          print('1');
          break;
        case 2:
          print('2');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        // 自定义左上角的菜单按钮
        leading: Builder(builder: (context) {
          return IconButton(
            // 自定义图标
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: () {
              //打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        // 导航栏右侧菜单
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print('分享');
            },
          ),
        ],
        // 生成Tab菜单
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      // 抽屉
      drawer: new MyDrawer(),
      // 创建三个tab页
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
      // 底部导航，常规效果
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text("Home"),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.business),
//            title: Text("Business"),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.school),
//            title: Text("School"),
//          ),
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        onTap: _onItemTapped,
//      ),
      // 底部导航栏实现"打洞"效果
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        // 底部导航栏打一个圆形的洞
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home)),
            // 中间位置空出
            SizedBox(),
            IconButton(icon: Icon(Icons.business)),
          ],
          // 均分底部导航栏横向空间
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  void _onAdd() {
    print('_onAdd');
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        "assets/images/avatar1.png",
                        width: 80,
                      ),
                    ),
                    Text(
                      "Wendux",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("Add account"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Manage Setting"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
