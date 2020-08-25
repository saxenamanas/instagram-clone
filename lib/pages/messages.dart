import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Insta/models/user.dart';

class FindFriend extends StatefulWidget {
  @override
  _FindFriend createState() => _FindFriend();
}

class _FindFriend extends State<FindFriend> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String query = '';
  InstaUser friend;

  Widget conversationHead() {
    return ListTile();
  }

  Future follow() async {
    await db.collection('users').doc(friend.getUid).update({
      'followersList': FieldValue.arrayUnion([auth.currentUser.uid])
    });
  }

  Future findFriend() async {
    QuerySnapshot friendSnap =
        await db.collection('users').where('email', isEqualTo: query).get();
    friendSnap.docs.forEach((element) {
      Map details = element.data();
      setState(() {
        friend = InstaUser.search(
            details['avatar'], details['username'], element.id);
      });
    });
  }

  Widget chatTile(bool isOnline) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(friend.getAvatar),
            radius: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: <Widget>[
                Text(
                  friend.getUsername,
                  style: TextStyle(fontSize: 16),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 5.0),
                //   child: Text(
                //     isOnline ? 'Active Now' : 'Active 2h ago',
                //     style: TextStyle(color: Colors.grey, fontSize: 14),
                //   ),
                // )
              ],
            ),
          ),
          Spacer(),
          (friend.getUid != auth.currentUser.uid)
              ? RaisedButton(
                  onPressed: () {
                    follow();
                  },
                  child: SizedBox(
                    width: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        // borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Center(child: Text('Follow')),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
        title: Text('Find Friends'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Icon(Icons.video_call),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Icon(Icons.message),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: TextField(
                  onChanged: (text) {
                    query = text;
                  },
                  decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          findFriend();
                        },
                      ),
                      hintText: 'Search your friends',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Text(
                  'Find Friend',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              friend != null
                  ? chatTile(true)
                  : Center(child: Text('Search a user by email')),
            ],
          ),
        ),
      ),
    );
  }
}
