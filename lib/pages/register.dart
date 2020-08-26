import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  String email = '', password = '', username = '';

  Future registerUser() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await db.collection('users').doc(auth.currentUser.uid).set({
        'email': email,
        'username': username,
        'bio': 'Hi! I use Instagram!',
        'avatar':
            'https://cdn2.iconfinder.com/data/icons/avatar-profile/449/avatar_user_default_contact_profile_male-512.png',
        'followers': 0,
        'following': 0,
        'followersList': [],
        'posts': 0
      });
      await db.collection('userPosts').doc(auth.currentUser.uid).set({
        'posts': ['bw5PcorndVNw52mvksts']
      });
    } catch (e) {}
  }

  bool value = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Instagram',
                style: TextStyle(
                    color: Colors.white, fontSize: 40.0, fontFamily: 'Satisfy'),
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
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextFormField(
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
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextFormField(
                        onChanged: (text) {
                          email = text;
                        },
                        decoration: InputDecoration(
                          hintText: 'E-mail',
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
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextFormField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
              )),
              // CheckboxListTile(
              //   activeColor: Colors.grey,
              //   title: Text("I agree with the terms."),
              //   value: value,
              //   onChanged: (newValue) {
              //     setState(() {
              //       value = !value;
              //     });
              //   },
              //   // controlAffinity:
              //   //     ListTileControlAffinity.leading, //  <-- leading Checkbox
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: RaisedButton(
                  onPressed: () {
                    registerUser();
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Center(child: Text('Create my account')),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
