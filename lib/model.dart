class Person {
  String? name;
  int? age;
  String? id;

  Person({this.name, this.age, this.id});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['age'] = age;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name ?? '' '$age';
  }
}
