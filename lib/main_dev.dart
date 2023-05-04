import 'package:flavor/utils/flavor_config.dart';
import 'package:flavor/utils/routes/routes.dart';
import 'package:flavor/utils/routes/service/locator.dart';
import 'package:flavor/utils/routes/service/navigation_service.dart';
import 'package:flavor/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  FlavorConfig(
    flavor: Flavor.dev,
    color: Colors.green,
    values: FlavorValues(
      searchUrl: 'https://autocomplete.clearbit.com/v1/companies/suggest',
      baseUrl: 'https://jsonplaceholder.typicode.com/users',
    ),
  );

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: ScreenUtilInit(
          designSize: const Size(
            375,
            812,
          ), // Get this sizes from your figma or adobe xd designs.
          builder: (context, child) {
            return  MaterialApp(
              title: 'Ready to Go',
               navigatorKey: locator<NavigationService>().navigatorKey,
              onGenerateRoute: Routing.generateRoute,
              home: const HomePage(),
            );
          }),
    );
  }
}
