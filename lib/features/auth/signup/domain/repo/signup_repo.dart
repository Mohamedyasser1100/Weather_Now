import 'package:flutter/material.dart';

abstract class SignupRepo {
  Future<void> signup(BuildContext context, String email, String password);
}
