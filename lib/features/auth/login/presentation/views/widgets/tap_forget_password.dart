import 'package:flutter/material.dart';
import 'package:weather_now/core/utils/app_colors.dart';
import 'package:weather_now/core/utils/app_style.dart';

class TapForgetPassword extends StatelessWidget {
  const TapForgetPassword({super.key, this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          'Forget Password?',
          style: AppStyle.medium18(context).copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
