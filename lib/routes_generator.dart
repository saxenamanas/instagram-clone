import 'package:Insta/pages/camera.dart';
import 'package:Insta/pages/comments.dart';
import 'package:Insta/pages/dashboard.dart';
import 'package:Insta/pages/login.dart';
import 'package:Insta/pages/messages.dart';
import 'package:Insta/pages/post.dart';
import 'package:Insta/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:Insta/pages/maintab.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/camera':
        return MaterialPageRoute(builder: (_) => CameraApp());
      case '/messages':
        return MaterialPageRoute(builder: (_) => Messages());
      case '/login':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/posts':
        return MaterialPageRoute(builder: (_) => Post());
      case '/comments':
        return MaterialPageRoute(builder: (_) => Comments());
      case '/tabs':
        return MaterialPageRoute(builder: (_) => MainMenu());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
