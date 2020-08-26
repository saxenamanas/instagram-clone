import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InstaUser {
  String uid, avatar, bio, email, username;
  int posts, following, followers;
  String get getAvatar => avatar;
  String get getEmail => email;
  String get getBio => bio;
  String get getUsername => username;
  String get getUid => uid;
  int get getPosts => posts;
  int get getFollowers => followers;
  int get getFollowing => following;
  InstaUser(avatar, bio, email) {
    this.avatar = avatar;
    this.bio = bio;
    this.email = email;
  }

  InstaUser.sec(avatar, bio, username, posts, followers, following) {
    this.avatar = avatar;
    this.bio = bio;
    this.username = username;
    this.posts = posts;
    this.followers = followers;
    this.following = following;
  }
  InstaUser.post(avatar, username) {
    this.avatar = avatar;
    this.username = username;
  }
  InstaUser.search(avatar, username, userId) {
    this.avatar = avatar;
    this.username = username;
    this.uid = userId;
  }
}
