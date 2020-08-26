import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'loader.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() {
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfile> {
  String username = '', bio = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool showLoader;
  String url;
  final ImagePicker _picker = ImagePicker();
  PickedFile postImage;

  selectPostImage() async {
    PickedFile temp = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      postImage = temp;
    });
  }

  Future getInititalValue() async {
    DocumentSnapshot res =
        await db.collection('users').doc(auth.currentUser.uid).get();
    setState(() {
      username = res.data()['username'];
      bio = res.data()['bio'];
    });
    print(bio);
  }

  Future updateValues() async {
    if (postImage != null) {
      final StorageReference storageReference =
          FirebaseStorage().ref().child('userAvatar/' + auth.currentUser.uid);
      final StorageUploadTask uploadTask =
          storageReference.putFile(File(postImage.path));
      await uploadTask.onComplete;
      print('File Uploaded');
      url = await storageReference.getDownloadURL();
    }
    (postImage != null)
        ? await db
            .collection('users')
            .doc(auth.currentUser.uid)
            .update({'username': username, 'bio': bio, 'avatar': url})
        : await db.collection('users').doc(auth.currentUser.uid).update({
            'username': username,
            'bio': bio,
          });
    Navigator.of(context).pop();
  }

  void initState() {
    // checkStatus();
    showLoader = false;
    getInititalValue();
    super.initState();
  }

  Widget build(BuildContext context) {
    if (showLoader)
      return Loader();
    else
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontFamily: 'Satisfy'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: CircleAvatar(
                        radius: 70.0,
                        backgroundImage: (postImage == null)
                            ? AssetImage('assets/person.jpg')
                            : FileImage(File(postImage.path))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        selectPostImage();
                      },
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Center(child: Text('Select Image')),
                        ),
                      ),
                    ),
                  ),
                  Form(
                      child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.grey,
                      primaryColorDark: Colors.grey,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: TextFormField(
                            initialValue: username,
                            // controller: username,
                            onChanged: (text) {
                              username = text;
                            },
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: TextFormField(
                            initialValue: bio,
                            onChanged: (text) {
                              bio = text;
                            },
                            maxLines: 8,
                            decoration: InputDecoration(
                              hintText: 'Your Bio',
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          showLoader = true;
                        });
                        updateValues();
                        // Navigator.of(context).pushNamed('/myprofile');
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Center(child: Text('Save')),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
