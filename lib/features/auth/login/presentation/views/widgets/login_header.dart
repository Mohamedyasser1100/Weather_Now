import 'package:flutter/material.dart';
import 'package:weather_now/core/utils/app_colors.dart';
import 'package:weather_now/core/utils/app_style.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style:
              AppStyle.semiBold35(context).copyWith(color: AppColors.kButton),
        ),
        Text(
          text2,
          style: AppStyle.regular18(context),
        )
      ],
    );
  }
}
