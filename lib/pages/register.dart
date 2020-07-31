import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
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
                    Navigator.of(context).pushNamed('/home');
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
