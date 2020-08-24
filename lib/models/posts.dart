import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class Post {
  String post, caption, author, postID;
  int likes;
  DateTime createdAt;
  Post(post, caption, author, postID, likes, createdAt) {
    this.post = post;
    this.caption = caption;
    this.author = author;
    this.postID = postID;
    this.likes = likes;
    this.createdAt = createdAt;
  }
  String get getPost => post;
  String get getCaption => caption;
  String get getPostId => postID;
  int get getLikes => likes;
  DateTime get getCreatedAt => createdAt;
}
