import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  static const platform = const MethodChannel("com.kevin/battery");
  int _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '当前电池信息:$_result',
              ),
              ElevatedButton(
                child: const Text("获取电池信息"),
                onPressed: getBatteryInfo,
              ),
            ],
          ),
        ));
  }

  void getBatteryInfo() async {
    final result = await platform.invokeMethod("getBatteryInfo");
    setState(() {
      _result = result;
    });
  }
}
