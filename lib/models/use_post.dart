class UserPost {
  final int id;
  final String title;
  final String content;
  final String userId;
  UserPost(
      {required this.id,
      required this.title,
      required this.content,
      required this.userId});

  factory UserPost.fromJson(Map<String, dynamic> json) {
    return UserPost(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        userId: json['user_id'].toString());
  }
}
