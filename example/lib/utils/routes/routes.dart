import 'package:example/views/home_page.dart';
import 'package:flutter/material.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
    
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
