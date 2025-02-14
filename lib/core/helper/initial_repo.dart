import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_now/features/auth/forget_password/data/repo/forget_password_repo_impl.dart';
import 'package:weather_now/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:weather_now/features/auth/forget_password/domain/usecases/forget_password_usecase.dart';
import 'package:weather_now/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:weather_now/features/auth/login/domain/repo/login_repo.dart';
import 'package:weather_now/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:weather_now/features/auth/signup/data/repo/signup_repo_impl.dart';
import 'package:weather_now/features/auth/signup/domain/repo/signup_repo.dart';
import 'package:weather_now/features/auth/signup/domain/usecases/signup_usecase.dart';

class RepositoriesInitializer {
  final LoginRepo loginRepo;
  final LoginUsecase loginUsecase;
  final SignupRepo signupRepo;
  final SignupUsecase signupUsecase;
  final ForgetPasswordRepo forgetPasswordRepo;
  final ForgetPasswordUseCase forgetPasswordUseCase;

  RepositoriesInitializer(FirebaseAuth firebaseAuth)
      : loginRepo = LoginRepoImpl(firebaseAuth),
        loginUsecase = LoginUsecase(LoginRepoImpl(firebaseAuth)),
        signupRepo = SignupRepoImpl(firebaseAuth),
        signupUsecase = SignupUsecase(signupRepoImpl(firebaseAuth)),
        forgetPasswordRepo = ForgetPasswordRepoImpl(firebaseAuth),
        forgetPasswordUseCase =
            ForgetPasswordUseCase(ForgetPasswordRepoImpl(firebaseAuth));
}
