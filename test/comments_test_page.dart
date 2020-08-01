import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart';

void main() => runApp(Comments());

class Comments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments',
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: dummyCommentGenerator(1),
          ),
        ),
      ),
    );
  }
}

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
  return Container(
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 20.0,
          ),
        ),
        Column(
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: userComment,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
