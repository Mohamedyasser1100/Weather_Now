import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_now/core/helper/initial_repo.dart';
import 'package:weather_now/features/auth/login/presentation/manager/login_provider.dart';
import 'package:weather_now/features/auth/signup/presentation/manager/signup_provider.dart';
import 'package:weather_now/features/home/presentation/manager/home_provider.dart';
import 'package:weather_now/firebase_options.dart';
import 'package:weather_now/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final repositories = RepositoriesInitializer(firebaseAuth);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(repositories.loginUseCase),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupProvider(repositories.signupUseCase),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              HomeProvider(getWeatherUseCase: repositories.getWeatherUseCase),
        ),
      ],
      child: const WeatherNow(),
    ),
  );
}
