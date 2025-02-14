import 'package:flutter/material.dart';

abstract class LoginRepo {
  Future<void> login(BuildContext context, String email, String password);
}
