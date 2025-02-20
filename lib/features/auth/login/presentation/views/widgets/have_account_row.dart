import 'package:flutter/material.dart';
import 'package:weather_now/core/utils/app_colors.dart';
import 'package:weather_now/core/utils/app_style.dart';

class HaveAccountRow extends StatelessWidget {
  const HaveAccountRow(
      {super.key, required this.text1, required this.text2, this.onTap});

  final String text1;
  final String text2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: AppStyle.regular18(context),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style:
                AppStyle.regular18(context).copyWith(color: AppColors.kButton),
          ),
        ),
      ],
    );
  }
}
