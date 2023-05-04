import 'package:flutter/material.dart';

class   NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }


  Future<dynamic> navigateReplace(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName,);
  }

   Future<dynamic> navigateToReplacement(String newRoute) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(newRoute, (route) => false);
  }

   Future<dynamic> navigateToWithArguments(String routeName, item) {
    return navigatorKey.currentState!.pushNamed(routeName,arguments: item);
  }
 

  goBack() {
    return navigatorKey.currentState!.pop();
  }
}
