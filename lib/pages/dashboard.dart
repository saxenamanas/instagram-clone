import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class Dashboard extends StatefulWidget{
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard>{

  final postList = Set<String>();

  Widget yourStatus(){
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right:10.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage('assets/person.jpg')
              ),
          SizedBox(height: 5,),
          Center(
            child: Text('Your Story'),
          )
        ],
      ),
    );
  }
  
  Widget status(){
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right:10.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage('assets/person-2.jpg')
              ),
          SizedBox(height: 5,),
          Center(
            child: Text('John Doe'),
          )
        ],
      ),
    );
  }

  Widget statusBar(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 90,
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              yourStatus(),
              status(),
              status(),
              status(),
              status()
          ],
          ),
      ),
    );
  }

  Widget postCard(context,String key){
    bool isLiked = postList.contains(key);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(
          color: Colors.grey[700],
          thickness: 0.2,
          ),
        Row(
          children: <Widget>[

            SizedBox(width: 10,),
            CircleAvatar(
            backgroundImage: AssetImage('assets/person-3.jpeg'),
          ),

            SizedBox(width: 10,),
            Text(
              'the_good_quotes'
            ),
            Spacer(),
            Icon(Icons.more_vert),
            SizedBox(width: 10,)
          ]
        ),
        
        Padding(
          padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
          child: GestureDetector(
            onDoubleTap: (){
              setState(() {
              if(postList.contains(key)){
                postList.remove(key);
              }else{
                postList.add(key);
              }
              });
              print(postList);

            },
                      child: Container(
              height: MediaQuery.of(context).size.height/3+20,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('assets/post.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: (){
              setState(() {
              if(postList.contains(key)){
                postList.remove(key);
              }else{
                postList.add(key);
              }
              });
              },
                          child: Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: isLiked ? Icon(Icons.favorite,color: Colors.red,size: 25,) :Icon(Icons.favorite_border,size: 25,),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Icon(Icons.insert_comment,size: 25,),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Icon(Icons.share,size: 25,),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left:30.0),
              child: Icon(Icons.bookmark_border,size: 25,),
            ),
            SizedBox(width: 10,),
          ],
        ),

        Padding(
              padding: const EdgeInsets.only(left:10.0,top:10),
              child: Text('1,000 likes',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(left:10.0,top:5),
              child: Text('View all 10 comments',
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
            ),

            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: CircleAvatar(
                    backgroundImage: AssetImage('assets/person.jpg'),
                    radius: 13,
                ),
                  ),

                GestureDetector(
                  onTap: (){

                  },
                                  child: Padding(
                    padding: const EdgeInsets.only(top:8.0,left:20),
                    child: Text('Add a comment...',
                    style: TextStyle(
                      color: Colors.grey
                    ),
              ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left:10.0,top:10),
              child: Text('Just now',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey
                ),
              ),
            )
       ], 
    );
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: <Widget>[
            SizedBox(width: 10,),
            Icon(Icons.camera_alt),
        ],
        ),
        title: Text('Instagram'),
        actions: <Widget>[
          Icon(Icons.message),
          SizedBox(width: 10,)
        ],
        ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            statusBar(),
                  postCard(context,'1'),
                  postCard(context,'2')
          ],
        ),
      ),
      
    );
  }
}