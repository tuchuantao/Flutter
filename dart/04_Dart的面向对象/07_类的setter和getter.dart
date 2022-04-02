main(List<String> args) {
  final p = Person();

  // 直接访问属性
  p.name = "why";
  print(p.name);

  // 通过getter和setter访问
  p.setName = "lilei";
  print(p.getName);
}


class Person {
  // Dart 没有 pubulic、protect、default、private 修饰符
  late String name;
  late String _name; // 与Java不同，Dart没有关键字public、protected和private。如想设置私有变量或函数，则变量和函数名以下划线（_）开头。

  // setter
  set setName(String name) => this.name = name;
  // getter
  String get getName => name;
}