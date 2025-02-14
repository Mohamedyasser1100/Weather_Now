import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_now/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:weather_now/features/auth/login/domain/repo/login_repo.dart';
import 'package:weather_now/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:weather_now/features/auth/signup/data/repo/signup_repo_impl.dart';
import 'package:weather_now/features/auth/signup/domain/repo/signup_repo.dart';
import 'package:weather_now/features/auth/signup/domain/usecases/signup_usecase.dart';

class RepositoriesInitializer {
  final LoginRepo loginRepository;
  final LoginUsecase loginUseCase;
  final SignupRepo signupRepository;
  final SignupUsecase signupUseCase;

  RepositoriesInitializer(FirebaseAuth firebaseAuth)
      : loginRepository = LoginRepoImpl(firebaseAuth),
        loginUseCase = LoginUsecase(LoginRepoImpl(firebaseAuth)),
        signupRepository = SignupRepoImpl(firebaseAuth),
        signupUseCase = SignupUsecase(SignupRepoImpl(firebaseAuth));
}
