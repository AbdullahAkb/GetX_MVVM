import 'dart:async';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices {
  UserPreferenceViewModel userPreferenceViewModel = UserPreferenceViewModel();

  void isLogin() {
    userPreferenceViewModel.getUser().then((value) {
      print(value.isLogin);
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(
          const Duration(seconds: 3),
          () {
            Get.toNamed(RoutesName.loginView);
          },
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () {
            Get.toNamed(RoutesName.homeView);
          },
        );
      }
    });
  }
}
