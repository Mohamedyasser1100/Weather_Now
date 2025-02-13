import 'package:flutter/material.dart';
import 'package:weather_now/features/auth/forget_password/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetPasswordViewBody(),
    );
  }
}
