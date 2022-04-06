import 'package:flutter/material.dart';

main() => runApp(const MyApp());

/*
 * Widget:
 * 有状态Widget: StatefulWidget   在运行过程中有一些状态（data）需要改变
 * 无状态Widget: StatelessWidget  内容是确定没有状态（data）的改变
 */
class MyApp extends StatelessWidget {
  // StatelessWidget 无状态widget
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
        title: const Text('商品列表'),
        backgroundColor: Colors.green,
      ),
      body: HomePageBody(),
    );
  }
}

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        HomeProductItem("Apple1", "Macbook1",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        const SizedBox(
          height: 6,
        ),
        HomeProductItem("Apple2", "Macbook2",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        const SizedBox(
          height: 6,
        ),
        HomeProductItem("Apple3", "Macbook2",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
      ],
    );
  }
}

class HomeProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  final style1 = TextStyle(fontSize: 25, color: Colors.orange);
  final style2 = TextStyle(fontSize: 20, color: Colors.green);

  HomeProductItem(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(
              width: 5, // 设置边框的宽度
              color: Colors.grey // 设置边框的颜色
              )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(title, style: style1),
            ],
          ),
          Text(desc, style: style2),
          Image.network(imageURL)
        ],
      ),
    );
  }
}
