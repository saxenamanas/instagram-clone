import 'package:Insta/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:Insta/routes.generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
          // initialRoute: '/',
         home: Dashboard(),
        title: 'Que ',
        onGenerateRoute: RouteGenerator.generateRoute,                                                                                                                                                                                                                                                                                                                                                                                                                              
        theme: ThemeData.dark(),
      );
  }
}

