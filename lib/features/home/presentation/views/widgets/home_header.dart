import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_now/core/utils/app_style.dart';
import 'package:weather_now/features/home/presentation/manager/home_provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: Column(
        children: [
          Text(
            homeProvider.weather?.cityName ?? "--",
            style: AppStyle.semiBold35(context),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '24 Feb',
            style: AppStyle.semiBold20(context),
          )
        ],
      ),
    );
  }
}
