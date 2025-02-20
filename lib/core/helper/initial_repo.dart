import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_now/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:weather_now/features/auth/login/domain/repo/login_repo.dart';
import 'package:weather_now/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:weather_now/features/auth/signup/data/repo/signup_repo_impl.dart';
import 'package:weather_now/features/auth/signup/domain/repo/signup_repo.dart';
import 'package:weather_now/features/auth/signup/domain/usecases/signup_usecase.dart';
import 'package:weather_now/features/home/data/repo/weather_repositry_impl.dart';
import 'package:weather_now/features/home/data/source/weather_remote_data_source.dart';
import 'package:weather_now/features/home/domain/repo/weather_repositry.dart';
import 'package:weather_now/features/home/domain/usecase/weather_use_case.dart';
import 'package:http/http.dart' as http;

class RepositoriesInitializer {
  final LoginRepo loginRepository;
  final LoginUsecase loginUseCase;
  final SignupRepo signupRepository;
  final SignupUsecase signupUseCase;
  final WeatherRepository weatherRepository;
  final GetWeatherUseCase getWeatherUseCase;

  RepositoriesInitializer(FirebaseAuth firebaseAuth)
      : loginRepository = LoginRepoImpl(firebaseAuth),
        loginUseCase = LoginUsecase(LoginRepoImpl(firebaseAuth)),
        signupRepository = SignupRepoImpl(firebaseAuth),
        signupUseCase = SignupUsecase(SignupRepoImpl(firebaseAuth)),
        weatherRepository =
            WeatherRepositoryImpl(WeatherRemoteDataSource(http.Client())),
        getWeatherUseCase = GetWeatherUseCase(
            WeatherRepositoryImpl(WeatherRemoteDataSource(http.Client())));
}
