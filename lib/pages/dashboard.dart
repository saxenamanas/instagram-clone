import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Insta/models/user.dart';
import 'package:flutter/scheduler.dart';
import 'package:Insta/pages/loader.dart';
import 'package:Insta/models/posts.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  List<Post> postFeed = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  InstaUser user;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future getUserData() async {
    print('Auth id is ' + auth.currentUser.uid);
    DocumentSnapshot res =
        await db.collection('users').doc(auth.currentUser.uid).get();
    dynamic data = res.data();
    setState(() {
      user = InstaUser(data['avatar'], data['bio'], data['email']);
    });
  }

  Future getPosts() async {
    List<String> postID = [];
    DocumentSnapshot data =
        await db.collection('userPosts').doc(auth.currentUser.uid).get();
    data.data()['posts'].forEach((ele) async {
      DocumentSnapshot res = await db.collection('posts').doc(ele).get();
      setState(() {
        postFeed.add(Post(
            res.data()['post'],
            res.data()['caption'],
            res.data()['author'],
            res.data()['postId'],
            res.data()['likes'],
            res.data()['createdAt']));
      });
    });
  }

  void initState() {
    getUserData();
    getPosts();
    super.initState();
  }

  final postList = Set<String>();

  Widget yourStatus() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/myprofile');
        },
        child: Column(
          children: <Widget>[
            CircleAvatar(
                radius: 30.0, backgroundImage: NetworkImage(user.getAvatar)),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text('Your Story'),
            )
          ],
        ),
      ),
    );
  }

  Widget status() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
              radius: 30.0, backgroundImage: AssetImage('assets/person-2.jpg')),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text('John Doe'),
          )
        ],
      ),
    );
  }

  Widget statusBar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 90,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            yourStatus(),
            // status(),
            // status(),
            // status(),
            // status(),
            // status(),
            // status(),
            // status()
          ],
        ),
      ),
    );
  }

  Widget postCard(context, String key) {
    bool isLiked = postList.contains(key);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(
          color: Colors.grey[700],
          thickness: 0.2,
        ),
        Row(children: <Widget>[
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/person-3.jpeg'),
          ),
          SizedBox(
            width: 10,
          ),
          Text('the_good_quotes'),
          Spacer(),
          Icon(Icons.more_vert),
          SizedBox(
            width: 10,
          )
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: GestureDetector(
            onDoubleTap: () {
              setState(() {
                if (postList.contains(key)) {
                  postList.remove(key);
                } else {
                  postList.add(key);
                }
              });
              print(postList);
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 3 + 20,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('assets/post.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  if (postList.contains(key)) {
                    postList.remove(key);
                  } else {
                    postList.add(key);
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: isLiked
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 25,
                      )
                    : Icon(
                        Icons.favorite_border,
                        size: 25,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Icon(
                Icons.insert_comment,
                size: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Icon(
                Icons.share,
                size: 25,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Icon(
                Icons.bookmark_border,
                size: 25,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10),
          child: Text(
            '1,000 likes',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/comments');
            },
            child: Text(
              'View all 10 comments',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/person.jpg'),
                radius: 13,
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 20),
                  child: Container(
                    height: 35,
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
//                        fontSize: 20.0,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.grey[850],
                        filled: true,
                        hintText: 'Add a comment...',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10),
          child: Text(
            'Just now',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (user == null || postFeed.isEmpty || postFeed == null)
      return Loader();
    else
      return Scaffold(
        appBar: AppBar(
          leading: Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/posts');
                  },
                  child: Icon(Icons.camera_alt)),
            ],
          ),
          title: Text('Instagram',
              style: TextStyle(fontFamily: 'Satisfy', fontSize: 24.0)),
          actions: <Widget>[
            GestureDetector(
                onTap: () {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushNamed('/myprofile');
                  });
                },
                child: Icon(Icons.people)),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/messages');
                },
                child: Icon(Icons.message)),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              statusBar(),
              for (int i = 0; i < postList.length; i++)
                postCard(context, postFeed[i].getPostId)
            ],
          ),
        ),
      );
  }
}
