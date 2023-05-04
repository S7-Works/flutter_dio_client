import 'package:flavor/views/home_page.dart';
import 'package:flutter/material.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      ///
      ///
      ///
      /// used as follors  ```locator<NavigationService>().navigeteTo('go_to_contact') ```
      // case 'go_to_contact':
      //   return MaterialPageRoute(
      //     builder: (context) => const Contact(),
      //   );

      // Add your routes here :

      ///  defult route
      ///
      ///
      /// used as follors  ```locator<NavigationService>().navigeteTo('') ``` pass an empty string
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
