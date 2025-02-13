import 'package:flutter/material.dart';
import 'package:weather_now/core/utils/app_colors.dart';
import 'package:weather_now/core/utils/app_route.dart';
import 'package:weather_now/core/widgets/custome_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
        ),
        Center(
            child: CircleAvatar(
                radius: 50, child: Image.asset('assets/images/logo.png'))),
        Text(
          'Weather Now',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.darkerBlue),
        ),
        SizedBox(
          height: 80,
        ),
        CustomeButton(
          text: 'Login',
          textColor: Colors.white,
          onTap: () {
            Navigator.pushNamed(context, AppRoute.logIn);
          },
          color: AppColors.darkerBlue,
        )
      ],
    );
  }
}
