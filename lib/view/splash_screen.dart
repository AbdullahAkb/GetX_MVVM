import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/assets/image_assets.dart';
import 'package:getx_mvvm/res/components/internet_exception_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return InternetExceptionWidget(
      onPress: () {},
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              // height: 200,
              // width: 200,
              image: AssetImage(ImageAssets.logo),
            ),
          ),
          Text(
            "email_hint".tr,
            style: const TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
