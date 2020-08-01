import 'package:Insta/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:Insta/pages/maintab.dart';
import 'package:Insta/routes_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      home: SignIn(),
      // home: MainMenu(),
      title: 'Instagram ',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData.dark(),
    );
  }
}
