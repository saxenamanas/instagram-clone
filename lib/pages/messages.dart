import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget{
  @override
  _Messages createState() => _Messages();
}

class _Messages extends State<Messages>{

  Widget conversationHead(){
    return ListTile(
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back)),
        title: Text('Direct'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:10.0,right:10.0),
            child: Icon(Icons.video_call),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10.0),
            child: Icon(Icons.message),
          )
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width-50,
                child: TextField(
                  decoration: InputDecoration(
                    border:  OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}