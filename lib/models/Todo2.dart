import 'package:flutter_app_structure/models/use_post.dart';

class Todo2 {
  final int? id;
  final int age;
  final String name;
  final String address;
  final String phone;
  final String email;
  final List<UserPost>? post;

  Todo2(
      {this.id,
      required this.age,
      required this.address,
      required this.email,
      required this.name,
      required this.phone,
      this.post});
  factory Todo2.fromJson(Map<String, dynamic> json) {
    var list = json['post'] as List;
    print(list);
    List<UserPost> postList = list.map((i) => UserPost.fromJson(i)).toList();
    return Todo2(
        id: json['id'],
        age: json['age'],
        email: json['email'],
        name: json['name'],
        address: json['address'],
        phone: json['phone'],
        post: postList);
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> todo2 = new Map<String, dynamic>();
  //   todo2['id'] = this.id;
  //   todo2['email'] = this.email;
  //   todo2['phone'] = this.phone;
  //   todo2['address'] = this.address;
  //   todo2['age'] = this.age;
  //   todo2['name'] = this.name;
  //   return todo2;
  // }
  // Map<String, dynamic> toJson(mydata) => {
  //       'name': name,
  //       'email': email,
  //       'age': age,
  //       'phone': phone,
  //       'addess': address,
  //       // 'name': name,
  // };
}
