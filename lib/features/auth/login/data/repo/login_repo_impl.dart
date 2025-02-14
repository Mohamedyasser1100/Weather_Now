import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_now/features/auth/login/domain/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final FirebaseAuth _firebaseAuth;

  LoginRepoImpl(this._firebaseAuth);

  @override
  @override
  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
      throw Exception(e.message);
    }
  }
}
