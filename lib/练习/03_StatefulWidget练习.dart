import 'package:flutter/material.dart';

main() => runApp(const MyApp());

/*
 * Widget:
 * 有状态Widget: StatefulWidget   在运行过程中有一些状态（data）需要改变
 * 无状态Widget: StatelessWidget  内容是确定没有状态（data）的改变
 */
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 热重载最主要是执行 build方法
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefulWidget练习'),
        backgroundColor: Colors.green,
      ),
      body: HomePageBody("我找马冬梅"),
    );
  }
}

class HomePageBody extends StatefulWidget {
  final String message;

  const HomePageBody(this.message);

  @override
  State<StatefulWidget> createState() {
    return _HomePageBodyState();
  }
}

/*
 * 为什么Flutter在设计的时候StatefulWidget的build方法放在State中
 *  1.build出来的Widget是需要依赖State中的变量(状态/数据)
 *  2.在Flutter的运行过程中:
 *    Widget是不断的销毁和创建的
 *    当我们自己的状态发生改变时, 并不希望重新状态一个新的State
 */
// State是加_: 状态这个类只是给Widget使用
class _HomePageBodyState extends State<HomePageBody> {
  int _counter = 0;

  _HomePageBodyState() {
    print("_HomePageBodyState()");
  }

  @override
  void initState() {
    super.initState();
    print("_HomePageBodyState: initState()");
  }

  @override
  Widget build(BuildContext context) {
    print("_HomePageBodyState: build()");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _getButtons(),
        Text(
          "当前计数:$_counter",
          style: TextStyle(fontSize: 25),
        ),
        // NOTE: State 默认持有StatefulWidget的引用
        Text("传递的信息:${widget.message}")
      ],
    );
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
            child: const Text(
              "+",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            color: Colors.pink,
            onPressed: () {
              setState(() {
                _counter++;
              });
            }),
        RaisedButton(
            child: const Text(
              "-",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            color: Colors.purple,
            onPressed: () {
              _counter--;
              setState(() {});
            })
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("_HomePageBodyState: didChangeDependencies()");
  }

  @override
  void didUpdateWidget(covariant HomePageBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("_HomePageBodyState: didUpdateWidget()");
  }

  @override
  void dispose() {
    super.dispose();
    print("_HomePageBodyState: dispose()");
  }
}
