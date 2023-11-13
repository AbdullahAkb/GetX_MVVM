import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/login/login_view.dart';

import 'package:getx_mvvm/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.cupertino),
        GetPage(
            name: RoutesName.loginView,
            page: () => const LoginView(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.cupertino),
      ];
}
