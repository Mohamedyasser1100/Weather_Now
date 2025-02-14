import 'package:flutter/material.dart';
import 'package:weather_now/features/auth/forget_password/domain/repo/forget_password_repo.dart';

class ForgetPasswordUseCase {
  final ForgetPasswordRepo repository;

  ForgetPasswordUseCase(this.repository);

  Future<void> call(BuildContext context, String email) {
    return repository.resetPassword(context, email);
  }
}
