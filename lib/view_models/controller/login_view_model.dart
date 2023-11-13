import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/utils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.loginApi(data).then(
      (value) {
        if (value['error'] == "user not found") {
          Utils.snackbar("Login", "User Not Found");
        } else {
          Utils.snackbar("Login", "Login Successfully");
        }

        loading.value = false;
      },
    ).onError(
      (error, stackTrace) {
        Utils.snackbar(
          "Error",
          error.toString(),
        );
        loading.value = false;
      },
    );
  }
}
