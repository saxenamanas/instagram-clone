import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() {
    return _PostState();
  }
}

class _PostState extends State<Post> {
  var postImage;
  final ImagePicker _picker = ImagePicker();
  selectPostImage() async {
    var temp = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      postImage = temp;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: postImage != null
                  ? Image(
                      image: FileImage(File(postImage.path)),
                    )
                  : Container(),
            ),
            FlatButton(
              onPressed: () {
                selectPostImage();
              },
              child: Center(
                child: Text('Upload your image'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Your caption',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Center(child: Text('Make my post')),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
