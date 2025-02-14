import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_now/core/component/awesome_dialog.dart';
import 'package:weather_now/features/auth/signup/domain/repo/signup_repo.dart';

class SignupRepoImpl implements SignupRepo {
  final FirebaseAuth _firebaseAuth;

  SignupRepoImpl(this._firebaseAuth);

  @override
  Future<void> signup(
      BuildContext context, String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showAwesomeDialog(
          context,
          title: "Note!",
          des: 'The account already exists for that email.',
        );
      }
      throw Exception(e.message);
    }
  }
}
