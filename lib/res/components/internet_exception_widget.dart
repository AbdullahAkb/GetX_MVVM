import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';
import 'package:getx_mvvm/res/components/round_Button.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: height * .15,
            ),
            const Icon(
              Icons.cloud_off,
              color: AppColors.redColors,
              size: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                  child: Text(
                'internet_exception'.tr,
                textAlign: TextAlign.center,
              )),
            ),
            SizedBox(
              height: height * .15,
            ),
            InkWell(
              onTap: widget.onPress,
              child: Container(
                alignment: Alignment.center,
                height: 44,
                width: 160,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'retry'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
            SizedBox(
              height: height * .15,
            ),
            RoundButton(
              title: "Retry",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
