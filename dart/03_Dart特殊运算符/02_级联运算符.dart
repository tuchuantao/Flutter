main(List<String> args) {
  // var p = Person();
  // p.name = "why";
  // p.run();
  // p.eat();

  // 级联运算符 (链式调用)
  var p = Person()
            ..name = "why"
            ..eat()
            ..run();
}

class Person {
  late String name;

  void run() {
    print("running");
  }

  void eat() {
    print("eating");
  }
}

