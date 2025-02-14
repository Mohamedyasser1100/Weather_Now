import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_now/core/helper/validator.dart';
import 'package:weather_now/core/utils/app_colors.dart';
import 'package:weather_now/core/utils/app_route.dart';
import 'package:weather_now/core/widgets/custome_button.dart';
import 'package:weather_now/core/widgets/custome_text_field.dart';
import 'package:weather_now/features/auth/login/presentation/manager/login_provider.dart';
import 'package:weather_now/features/auth/login/presentation/views/widgets/have_account_row.dart';
import 'package:weather_now/features/auth/login/presentation/views/widgets/login_header.dart';
import 'package:weather_now/features/auth/login/presentation/views/widgets/tap_forget_password.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final loginAuthProvider = Provider.of<LoginProvider>(context);
    return Form(
      key: formState,
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          LoginHeader(
            text1: 'Welcome Back',
            text2: 'Login to your account',
          ),
          SizedBox(
            height: 60,
          ),
          CustomeTextField(
            hintText: 'Email',
            controller: emailController,
            validator: (value) {
              return validatorForEmail(value, maxVal: 30, minVal: 5);
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomeTextField(
            hintText: 'Password',
            controller: passwordController,
            isPassword: true,
            validator: (value) {
              return validatorForPassword(value, maxVal: 10, minVal: 5);
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TapForgetPassword(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.forgetPass);
                },
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          CustomeButton(
            text: 'Login',
            color: AppColors.primaryColor,
            onTap: () {
              if (formState.currentState!.validate()) {
                loginAuthProvider.loginAuth(
                    context, emailController.text, passwordController.text);
              }
            },
            textColor: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          HaveAccountRow(
            text1: 'Don\'t have an account?',
            text2: 'Register',
            onTap: () {
              Navigator.pushNamed(context, AppRoute.signUp);
            },
          )
        ],
      ),
    );
  }
}
