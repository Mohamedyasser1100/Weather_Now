import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_now/core/component/awesome_dialog.dart';
import 'package:weather_now/features/auth/login/domain/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final FirebaseAuth _firebaseAuth;

  LoginRepoImpl(this._firebaseAuth);

  @override
  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showAwesomeDialog(context,
            title: "Error!", des: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showAwesomeDialog(context,
            title: 'AppStrings.errorText',
            des: 'Wrong password provided for that user.');
      }
      throw Exception(e.message);
    }
  }
}
