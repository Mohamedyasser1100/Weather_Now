import 'package:flutter/material.dart';
import 'package:weather_now/core/utils/app_colors.dart';
import 'package:weather_now/core/utils/app_route.dart';
import 'package:weather_now/core/widgets/custome_button.dart';
import 'package:weather_now/core/widgets/custome_text_field.dart';
import 'package:weather_now/features/auth/login/presentation/views/widgets/have_account_row.dart';
import 'package:weather_now/features/auth/login/presentation/views/widgets/login_header.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 150,
        ),
        Center(
          child: LoginHeader(
            text1: 'Forget your password?',
            text2: 'Change your password now !',
          ),
        ),
        SizedBox(
          height: 60,
        ),
        CustomeTextField(hintText: 'Email', controller: emailController),
        SizedBox(
          height: 40,
        ),
        CustomeButton(
          text: 'Reset',
          color: AppColors.primaryColor,
          onTap: () {},
          textColor: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        HaveAccountRow(
          text1: 'Remember your password?',
          text2: 'Login',
          onTap: () {
            Navigator.pushNamed(context, AppRoute.logIn);
          },
        )
      ],
    );
  }
}
