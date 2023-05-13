import 'dart:convert';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.title,
      required this.id,
      required this.body,
      required this.userId});

  factory Post.fromJson({required Map<String, dynamic> json}) {
    return Post(
        title: json['title'],
        id: json['id'],
        body: json['body'],
        userId: json['userId']);
  }
}
