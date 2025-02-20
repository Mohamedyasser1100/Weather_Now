import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_now/core/helper/validator.dart';
import 'package:weather_now/core/utils/app_colors.dart';
import 'package:weather_now/core/utils/app_route.dart';
import 'package:weather_now/core/widgets/custome_button.dart';
import 'package:weather_now/core/widgets/custome_text_field.dart';
import 'package:weather_now/features/auth/login/presentation/views/widgets/have_account_row.dart';
import 'package:weather_now/features/auth/login/presentation/views/widgets/login_header.dart';
import 'package:weather_now/features/auth/signup/presentation/manager/signup_provider.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signuoAuthProvider = Provider.of<SignupProvider>(context);

    return Form(
      key: formState,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            LoginHeader(
              text1: 'Register',
              text2: 'Create your account',
            ),
            SizedBox(height: 60),
            CustomeTextField(
              hintText: 'Username',
              controller: nameController,
              validator: (value) {
                return validatorForName(value, maxVal: 18, minVal: 5);
              },
            ),
            SizedBox(height: 20),
            CustomeTextField(
              hintText: 'Email',
              controller: emailController,
              validator: (value) {
                return validatorForEmail(value, maxVal: 20, minVal: 5);
              },
            ),
            SizedBox(height: 20),
            CustomeTextField(
              hintText: 'Password',
              controller: passwordController,
              isPassword: true,
              validator: (value) {
                return validatorForPassword(value, maxVal: 10, minVal: 5);
              },
            ),
            SizedBox(
              height: 120,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomeButton(
                  text: 'Register',
                  color: AppColors.kButton,
                  onTap: () {
                    if (formState.currentState!.validate()) {
                      signuoAuthProvider.signupAuth(context,
                          emailController.text, passwordController.text);
                    }
                  },
                  textColor: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            HaveAccountRow(
              text1: 'Already have an account?',
              text2: 'Login',
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoute.logIn);
              },
            )
          ],
        ),
      ),
    );
  }
}
