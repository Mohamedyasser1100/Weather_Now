import 'package:flutter/material.dart';
import 'package:weather_now/features/auth/login/presentation/views/login_view.dart';
import 'package:weather_now/features/home/presentation/views/home_view.dart';
import 'package:weather_now/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:weather_now/features/auth/signup/presentation/views/sign_up_view.dart';

abstract class AppRoute {
  static const String onBoarding = "/onBoarding";
  static const String signUp = "/signup";
  static const String logIn = "/login";
  static const String forgetPass = "/forgetPass";
  static const String homeView = "/homeView";

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case onBoarding:
        return MaterialPageRoute(builder: (context) => OnboardingView());
      case logIn:
        return MaterialPageRoute(builder: (context) => LoginView());
      case signUp:
        return MaterialPageRoute(builder: (context) => SignUpView());

      case homeView:
        return MaterialPageRoute(builder: (context) => HomeView());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
