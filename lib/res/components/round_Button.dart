import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.loading = false,
    required this.title,
    required this.onPressed,
    this.height = 50,
    this.width = 60,
    this.textColor = AppColors.primaryTextColor,
    this.buttonColor = AppColors.buttonPrimaryColor,
  });

  final bool loading;
  final String title;
  final VoidCallback onPressed;
  final double height, width;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: loading
          ? CircularProgressIndicator()
          : Center(
              child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.whiteColor),
            )),
    );
  }
}
