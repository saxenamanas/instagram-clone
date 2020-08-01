import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  List<Widget> dummyCommentGenerator(int numOfComments) {
    List<Widget> commentList = [];
    for (int i = 0; i < numOfComments; i++) {
      commentList.add(
        unitComment(
          'user' + i.toString(),
          createWord(numWords: 25),
        ),
      );
    }
    return commentList;
  }

  Widget unitComment(String userName, String userComment) {
    bool isLiked = true;
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        color: Colors.grey[850],
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 20.0,
          ),
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: userName,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                TextSpan(
                  text: ' ' + userComment,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            softWrap: true,
            maxLines: 10,
          ),
          trailing: GestureDetector(
            onTap: () {
              setState(() {
                if (isLiked) {
                  isLiked = false;
                  print('true');
                } else {
                  isLiked = true;
                  print('false');
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: dummyCommentGenerator(15),
          ),
        ),
      ),
    );
  }
}
