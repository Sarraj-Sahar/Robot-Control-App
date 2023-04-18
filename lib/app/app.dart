import 'package:flutter/material.dart     ';
import 'package:get/get.dart';
import 'screens/screens.dart';

import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: MainScreenBinding(),
      initialBinding: AuthBinding(),

      initialRoute: Routes.splash, //.splash
      getPages: Routes.routes,
      title: 'P-GUARD',
      debugShowCheckedModeBanner: false,
    );
  }
}
