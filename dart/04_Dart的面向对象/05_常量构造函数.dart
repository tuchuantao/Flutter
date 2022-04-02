main(List<String> args) {

  const p1 = Person("why");
  const p2 = Person("why");
  print(identical(p1, p2)); // 使用常量构造函数生成的对象，常量值相同时，是同一个对象

}

class Person {
  final String name;
  // final String age;

  // 常量构造函数  const
  const Person(this.name);
  // const Person(this.name, this.age);
}