import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_now/core/utils/app_route.dart';
import 'package:weather_now/firebase_options.dart';

void main() async {
  runApp(const WeatherNow());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class WeatherNow extends StatelessWidget {
  const WeatherNow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.onBoarding,
        onGenerateRoute: AppRoute.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}
