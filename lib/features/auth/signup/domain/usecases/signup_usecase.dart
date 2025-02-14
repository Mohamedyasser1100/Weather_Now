import 'package:flutter/material.dart';
import 'package:weather_now/features/auth/signup/domain/repo/signup_repo.dart';

class SignupUsecase {
  final SignupRepo signupRepo;

  SignupUsecase(this.signupRepo);

  Future<void> call(BuildContext context, String email, String password) {
    return signupRepo.signup(context, email, password);
  }
}
