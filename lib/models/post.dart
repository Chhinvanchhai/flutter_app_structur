import 'package:flutter_app_structure/controllers/resource.dart';

class Post2 {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post2(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
  factory Post2.fromJson(Map<String, dynamic> json) {
    return Post2(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
