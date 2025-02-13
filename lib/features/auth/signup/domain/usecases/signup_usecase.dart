import 'package:weather_now/features/auth/signup/domain/repo/signup_repo.dart';

class SignupUsecase {
  final SignupRepo signupRepo;

  SignupUsecase({required this.signupRepo});

  Future<void> signup(String email, String password) {
    return signupRepo.signup(email, password);
  }
}
