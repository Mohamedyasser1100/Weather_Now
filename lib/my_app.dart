import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_now/core/utils/app_colors.dart';
import 'package:weather_now/core/utils/app_route.dart';

class WeatherNow extends StatelessWidget {
  const WeatherNow({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? AppRoute.onBoarding
          : AppRoute.homeView,
      onGenerateRoute: AppRoute.generateRoute,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.kPrimaryColor),
    );
  }
}
