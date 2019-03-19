import 'package:dart_demo1/custom_ui_framework.dart';
import 'package:dart_demo1/darttest/dart_test_route.dart';
import 'package:dart_demo1/file/file_operation.dart';
import 'package:dart_demo1/http/http_route.dart';
import 'package:dart_demo1/plugins/plugins_route.dart';
import 'package:dart_demo1/widgetstest/widgets_test.dart';

/// 此行代码作用是导入了Material UI组件库。Material是一种标准的移动端和web端的视觉设计语言，
/// Flutter默认提供了一套丰富的Material风格的UI组件。
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'echo.dart';
import 'counter.dart';
import 'state_manage.dart';

/*
 * 与C/C++、Java类似，Flutter 应用中main函数为应用程序的入口，main函数中调用了
 * runApp 方法，它的功能是启动Flutter应用，它接受一个Widget参数，在本示例中它是MyApp类
 * 的一个实例，该参数代表Flutter应用。
 * main函数使用了(=>)符号，这是Dart中单行函数或方法的简写。
 */
void main() => runApp(MyApp());

/// 为了查看启动图
//main(){
//
//}
/*
    1、MyApp类代表Flutter应用，它继承了 StatelessWidget类，这也就意味着应用本身也是一个widget。
    2、在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)。
    3、Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()方法来描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
    4、MaterialApp 是Material库中提供的Flutter APP框架，通过它可以设置应用的名称、主题、语言、首页及路由列表等。MaterialApp也是一个widget。
    5、Scaffold 是Material库中提供的页面脚手架，它包含导航栏和Body以及FloatingActionButton（如果需要的话）。 本书后面示例中，路由默认都是通过Scaffold创建。
    6、home 为Flutter应用的首页，它也是一个widget。
 */

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 应用标题
      title: 'Flutter Demo',
      // 应用主题
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // 设置主题颜色
        primarySwatch: Colors.purple,
      ),
      // 注册路由表
      routes: {
        "new_page": (context) => new NewRoute(),
        "echo": (context) => new EchoPage(),
        "counter": (context) => new CounterPage(),
        "state_manage": (context) => new StateManagePage(),
        "widgets_test": (context) => new WidgetsTestPage(),
        "file_operation": (context) => new FileOperationRoute(),
        "http": (context) => new HttpRouteText(),
        "plugins": (context) => new PluginsRouteText(),
        "custom_ui_framework": (context) => new CustomUIFrameworkRoute(),
        "dart_test": (context) => new DartTestRoute(),
      },
      // 应用首页路由
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
//  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  /// 该函数的作用是先自增_counter，然后调用setState 方法。
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display4,
                ),
                FlatButton(
                  child: Text("open new route"),
                  textColor: Colors.blue,
                  color: Colors.black,
                  onPressed: () {
                    // 导航到新路由
                    Navigator.pushNamed(context, "new_page");
//                Navigator.push(context,
//                    new MaterialPageRoute(builder: (context) {
//                  return new NewRoute();
//                }));
                  },
                ),
                RandomWordWidget(),
                FlatButton(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("open echo page"),
                  textColor: Colors.blue,
                  color: Colors.black,
                  onPressed: () {
                    // 导航到新路由
                    Navigator.pushNamed(context, "echo");
                  },
                ),
                FlatButton(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("open counter page"),
                  textColor: Colors.blue,
                  color: Colors.black,
                  onPressed: () {
                    // 导航到新路由
                    Navigator.pushNamed(context, "counter");
                  },
                ),
                FlatButton(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("open state manage page"),
                  textColor: Colors.blue,
                  color: Colors.black,
                  onPressed: () {
                    // 导航到新路由
                    Navigator.pushNamed(context, "state_manage");
                  },
                ),
                FlatButton(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Widgets相关练习"),
                  textColor: Colors.blue,
                  color: Colors.black,
                  onPressed: () {
                    // 导航到新路由
                    Navigator.pushNamed(context, "widgets_test");
                  },
                ),
                FlatButton(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("文件操作"),
                  textColor: Colors.blue,
                  color: Colors.black,
                  onPressed: () {
                    // 导航到新路由
                    Navigator.pushNamed(context, "file_operation");
                  },
                ),
                FlatButton(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Http"),
                  textColor: Colors.blue,
                  color: Colors.black,
                  onPressed: () {
                    // 导航到新路由
                    Navigator.pushNamed(context, "http");
                  },
                ),
                FlatButton(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Plugins"),
                  textColor: Colors.blue,
                  color: Colors.black,
                  onPressed: () {
                    // 导航到新路由
                    Navigator.pushNamed(context, "plugins");
                  },
                ),
                FlatButton(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("自定义UI框架"),
                  textColor: Colors.blue,
                  color: Colors.black,
                  onPressed: () {
                    // 导航到新路由
                    Navigator.pushNamed(context, "custom_ui_framework");
                  },
                ),
                FlatButton(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Dart学习"),
                  textColor: Colors.blue,
                  color: Colors.black,
                  onPressed: () {
                    // 导航到新路由
                    Navigator.pushNamed(context, "dart_test");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class RandomWordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}
