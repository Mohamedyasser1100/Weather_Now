import 'package:flutter/material.dart';
import 'package:weather_now/core/utils/app_style.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.image, required this.title});

  final String image, title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          width: width * 0.08,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: AppStyle.regular18(context),
        )
      ],
    );
  }
}
