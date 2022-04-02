main(List<String> args) {
  final sm = SuperMan();
  sm.running();
  sm.flying();
}

mixin Runner {
  void running() {
    print("runner running");
  }
}

// mixin 混入
mixin Flyer {
  void flying() {
    print("flying");
  }
}

class Animal {
  void eating() {
    print("动物次东西");
  }

  void running() {
    print("animal running");
  }
}

class SuperMan extends Animal with Runner, Flyer {
  @override
  void eating() {
    super.eating();
  }

  // 先继承、后混入、有自己的方法使用自己的
  void running() {
    print("SuperMan running");
  }
}


