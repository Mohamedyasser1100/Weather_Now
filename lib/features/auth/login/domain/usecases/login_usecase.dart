import 'package:weather_now/features/auth/login/domain/repo/login_repo.dart';
import 'package:flutter/material.dart';

class LoginUsecase {
  final LoginRepo loginRepo;

  LoginUsecase(this.loginRepo);

  Future<void> call(String email, String password, BuildContext context) {
    return loginRepo.login(context, email, password);
  }
}
