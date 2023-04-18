// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import '../screens/screens.dart';

class Routes {
  static const login = '/login';
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const mainScreen = '/mainScreen';

  //
  static const home = '/home';
  static const camera = '/camera';
  static const sceanrio = '/sceanrio';
  static const mission = '/mission';
  static const settings = '/settings';

  static final routes = [
    GetPage(name: splash, page: () => SplashScreen(), binding: AuthBinding()),

    //CONTROLLER: add onboardingScreen controller and binding
    GetPage(name: onboarding, page: () => OnboardingScreen()),

    GetPage(name: login, page: () => Login(), binding: LoginBinding()),

    GetPage(name: mainScreen, page: () => MainScreen(), bindings: [
      AuthBinding(),
      MainScreenBinding(),
      ControlPanelBinding(),
      DrawerBinding(),
      HomeBinding(),
      CameraBinding(),
      ScenarioBinding(),
      MissionBinding()
    ]),

    //we use loginBinding for splash since we need the auth_binding inside it
    // to check if user is already logged in or not
  ];
}
