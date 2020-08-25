import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:Insta/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

class Post {
  String post, caption, author, postID;
  List<String> likedBy;
  int likes;
  InstaUser postAuthor;
  DateTime createdAt;
  Post(post, caption, author, postID, likes, createdAt, authorAvatar,
      authorUsername, likedBy) {
    this.post = post;
    this.caption = caption;
    this.author = author;
    this.postID = postID;
    this.likes = likes;
    this.createdAt = createdAt;
    this.likedBy = likedBy;
    postAuthor = InstaUser.post(authorAvatar, authorUsername);
  }

  String get getPost => post;
  String get getCaption => caption;
  String get getPostId => postID;
  int get getLikes => likes;
  DateTime get getCreatedAt => createdAt;
  InstaUser get getPostAuthor => postAuthor;
}
