import 'package:Insta/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:Insta/pages/maintab.dart';
import 'package:Insta/routes_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Insta/pages/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      home: Wrapper(),
      // home: MainMenu(),
      title: 'Instagram ',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData.dark(),
    );
  }
}
