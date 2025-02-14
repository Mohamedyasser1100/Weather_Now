import 'package:flutter/material.dart';
import 'package:weather_now/core/component/awesome_dialog.dart';
import 'package:weather_now/features/auth/forget_password/domain/usecases/forget_password_usecase.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  final ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordProvider(this.forgetPasswordUseCase);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> resetPassword(BuildContext context, String email) async {
    _setLoading(true);
    try {
      await forgetPasswordUseCase(context, email);
      showAwesomeDialog(
          // ignore: use_build_context_synchronously
          context,
          title: 'Note!.',
          des: AppStrings.checkYourBoxMessage);
    } catch (e) {
      showAwesomeDialog(
          // ignore: use_build_context_synchronously
          context,
          title: 'Error!',
          des: AppStrings.errorText);
    } finally {
      _setLoading(false);
    }
  }
}
