import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_Button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('login'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginVM.emailController.value,
                    focusNode: loginVM.emailFocusNode.value,
                    decoration: InputDecoration(
                      hintText: "email_hint".tr,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackbar("email_hint".tr, "Enter Email");
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginVM.emailFocusNode.value,
                          loginVM.passwordFocusNode.value);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: loginVM.passwordController.value,
                    focusNode: loginVM.passwordFocusNode.value,
                    decoration: InputDecoration(
                      hintText: "password_hint".tr,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackbar("password_hint".tr, "Enter Password");
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginVM.emailFocusNode.value,
                          loginVM.passwordFocusNode.value);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(() => RoundButton(
                  title: "login".tr,
                  width: 170,
                  loading: loginVM.loading.value,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginVM.loginApi();
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
