import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_now/core/utils/app_colors.dart';
import 'package:weather_now/features/home/presentation/manager/home_provider.dart';
import 'package:weather_now/features/home/presentation/views/widgets/home_details.dart';
import 'package:weather_now/features/home/presentation/views/widgets/home_header.dart';
import 'package:weather_now/features/home/presentation/views/widgets/weather_day_list_view.dart';
import 'package:weather_now/features/home/presentation/views/widgets/weather_info.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<HomeProvider>(context, listen: false).fetchWeather());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        if (homeProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.kButton,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: HomeHeader(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  HomeDetails(),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherInfo(
                        image: 'assets/images/air.png',
                        title:
                            "${homeProvider.weather?.windSpeed ?? "--"} km/h",
                      ),
                      WeatherInfo(
                        image: 'assets/images/cloud.png',
                        title: "${homeProvider.weather?.cloudiness ?? "--"}%",
                      ),
                      WeatherInfo(
                        image: 'assets/images/snow.png',
                        title: "${homeProvider.weather?.humidity ?? "--"}%",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  WeatherDayListView(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
