import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Center(child: Text('Login')),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
