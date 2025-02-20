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
          height: 320,
          child: Container(
            child: Image.asset('assets/images/Logo1.png'),
          ),
        ),
        Text(
          'Weather Now',
          style: TextStyle(
              fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 80,
        ),
        Center(
          child: CustomeButton(
            text: 'Login',
            textColor: Colors.white,
            onTap: () {
              Navigator.pushNamed(context, AppRoute.logIn);
            },
            color: AppColors.kButton,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CustomeButton(
            text: 'Register',
            color: AppColors.kPrimaryColor,
            onTap: () {
              Navigator.pushNamed(context, AppRoute.signUp);
            },
            textColor: Colors.white)
      ],
    );
  }
}
