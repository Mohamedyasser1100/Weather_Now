import 'package:weather_now/features/auth/login/domain/repo/login_repo.dart';

class LoginUsecase {
  final LoginRepo loginRepo;

  LoginUsecase(String email, String password, {required this.loginRepo});

  Future<void> call(String email, String password) {
    return loginRepo.login(email, password);
  }
}
