import 'package:flutter/material.dart';

abstract class ForgetPasswordRepo {
  Future<void> resetPassword(BuildContext context, String email);
}
