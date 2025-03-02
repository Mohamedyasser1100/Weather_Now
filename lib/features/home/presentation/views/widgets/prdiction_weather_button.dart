import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_now/core/utils/app_colors.dart';
import 'package:weather_now/core/utils/app_style.dart';
import 'package:weather_now/features/home/presentation/manager/home_provider.dart';

class WeatherPredictionButton extends StatelessWidget {
  const WeatherPredictionButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.8),
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          String prediction = await homeProvider.getWeatherPrediction();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              icon: Icon(
                FontAwesomeIcons.personRunning,
                color: AppColors.kGold,
                size: 40,
              ),
              backgroundColor: AppColors.darkBlue,
              title: Text(
                textAlign: TextAlign.center,
                prediction,
                style: AppStyle.medium18(context)
                    .copyWith(fontSize: 19, color: AppColors.primaryColor),
              ),
            ),
          );
        },
        child: const Icon(
          FontAwesomeIcons.personRunning,
          size: 35,
        ),
      ),
    );
  }
}
