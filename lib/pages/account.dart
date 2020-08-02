import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  Widget nameAndBio() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Wrap(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              'John Doe',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
              'Hi! I am some dummy text, which is gonna represent bio. This text is supposed to be pretty long.'),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'the_good_quotes',
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/person-3.jpeg'),
                    radius: 40,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          '9',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Text('Posts')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          '175',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Text('Followers')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          '264',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Text('Following')
                    ],
                  ),
                ],
              ),
              nameAndBio(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey[700])),
                    child: Center(child: Text('Edit Profile')),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.grid_on),
                  ),
                  Tab(
                    icon: Icon(Icons.person_pin),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
