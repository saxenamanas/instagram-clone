import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  @override
  _Messages createState() => _Messages();
}

class _Messages extends State<Messages> {
  Widget conversationHead() {
    return ListTile();
  }

  Widget chatTile(bool isOnline) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/person-3.jpeg'),
            radius: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: <Widget>[
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    isOnline ? 'Active Now' : 'Active 2h ago',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                )
              ],
            ),
          )
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
        title: Text('Direct'),
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
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
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
                  'Messages',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              chatTile(true),
              chatTile(false),
              chatTile(true),
              chatTile(true),
              chatTile(false),
              chatTile(false),
              chatTile(false),
              chatTile(false),
            ],
          ),
        ),
      ),
    );
  }
}
