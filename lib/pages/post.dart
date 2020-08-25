import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() {
    return _PostState();
  }
}

class _PostState extends State<Post> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  PickedFile postImage;
  String caption = '';
  final ImagePicker _picker = ImagePicker();
  selectPostImage() async {
    PickedFile temp = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      postImage = temp;
    });
  }

  Future makeMyPost() async {
    var ref = db.collection('posts').doc();
    final StorageReference storageReference =
        FirebaseStorage().ref().child('posts/' + ref.id);
    final StorageUploadTask uploadTask =
        storageReference.putFile(File(postImage.path));
    await uploadTask.onComplete;
    print('File Uploaded');
    String url = await storageReference.getDownloadURL();
    await ref.set({
      'post': url,
      'caption': caption,
      'likes': 0,
      'createdAt': DateTime.now(),
      'postId': ref.id,
      'author': auth.currentUser.uid,
      'likedBy': []
    });
    Navigator.of(context).pushNamed('/home');
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
                onChanged: (text) {
                  caption = text;
                },
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
            GestureDetector(
              onTap: () {
                makeMyPost();
              },
              child: Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
