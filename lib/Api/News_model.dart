import 'package:flutter/material.dart';

class News_model {
  final String title;

  News_model(
      {required this.title,
      required this.img,
      required this.time,
      required this.description,
      required this.author,
        required this.content,
      required this.url});

  final String img;
  final String time;
  final String description;
  final String author;
  final String url;
  final String content;

  factory News_model.fromJson(Map<String, dynamic> json) {
    return News_model(
      title: json["title"]??"",
      img: json["urlToImage"]??'asset/image1.jpg',
      time: json["publishedAt"]??"",
      description: json["description"]??"",
      author: json["author"]??"",
      url: json["url"]??"",
      content: json["content"]??"",
    );
  }
}
