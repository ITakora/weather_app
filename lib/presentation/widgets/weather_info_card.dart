import 'package:cuaca/data/models/forecast_day_model.dart';
import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.data});
  final List<ForecastDay> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 203, 229, 238),
          Color.fromARGB(160, 202, 220, 226),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      width: 370,
      height: 45,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/image/water-drops.png',
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${data[0].day.dailyChanceOfRain.toString()}%',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/image/snowflake.png',
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${data[0].day.dailyChanceOfSnow.toString()}%',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/image/wind.png',
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${data[0].day.maxwindKph.toString()} km/h',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
