import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_now/features/auth/forget_password/domain/repo/forget_password_repo.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final FirebaseAuth _firebaseAuth;

  ForgetPasswordRepoImpl(this._firebaseAuth);

  @override
  Future<void> resetPassword(BuildContext context, String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
