import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_now/core/utils/app_colors.dart';
import 'package:weather_now/core/utils/app_style.dart';
import 'package:weather_now/features/home/presentation/manager/home_provider.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Column(
      children: [
        Image.network(
          "https://openweathermap.org/img/wn/${homeProvider.weather?.icon}@4x.png",
        ),
        Text(
          "${homeProvider.weather?.temperature.toStringAsFixed(0) ?? "--"}°",
          style: AppStyle.semiBold35(context),
        ),
        Text(
          homeProvider.weather?.description ?? "--",
          style: AppStyle.medium18(context).copyWith(color: AppColors.kButton),
        ),
      ],
    );
  }
}
