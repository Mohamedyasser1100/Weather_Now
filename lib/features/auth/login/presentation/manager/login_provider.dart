import 'package:flutter/material.dart';
import 'package:weather_now/core/utils/app_route.dart';
import 'package:weather_now/features/auth/login/domain/usecases/login_usecase.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUsecase loginUseCase;

  LoginProvider(this.loginUseCase);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    _setLoading(true);
    try {
      await loginUseCase(email, password);
      Navigator.pushNamed(context, AppRoute.homeView);
    } catch (e) {
      print(e);
    } finally {
      _setLoading(false);
    }
  }
}
