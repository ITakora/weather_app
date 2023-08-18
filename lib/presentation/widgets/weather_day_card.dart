import 'package:cuaca/data/models/forecast_day_model.dart';
import 'package:cuaca/presentation/widgets/today_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherDay extends StatelessWidget {
  const WeatherDay({super.key, required this.data});
  final List<ForecastDay> data;

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat('EEEE, d MMM', 'id_ID').format(data[0].date);
    final jamPagi = DateFormat('HH:mm ', 'id_ID').format(data[0].hour[8].time);
    final jamSiang =
        DateFormat('HH:mm ', 'id_ID').format(data[0].hour[12].time);
    final jamSore = DateFormat('HH:mm ', 'id_ID').format(data[0].hour[16].time);
    final jamMalam =
        DateFormat('HH:mm ', 'id_ID').format(data[0].hour[22].time);

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 203, 229, 238),
          Color.fromARGB(160, 202, 220, 226),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      width: 370,
      height: 250,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'Today',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Text(date),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              TodayWidget(
                  suhu: '${data[0].hour[8].tempC} C',
                  image: 'https:${data[0].hour[8].condition.icon}',
                  jam: jamPagi),
              TodayWidget(
                  suhu: '${data[0].hour[12].tempC} C',
                  image: 'https:${data[0].hour[12].condition.icon}',
                  jam: jamSiang),
              TodayWidget(
                  suhu: '${data[0].hour[16].tempC} C',
                  image: 'https:${data[0].hour[16].condition.icon}',
                  jam: jamSore),
              TodayWidget(
                  suhu: '${data[0].hour[22].tempC} C',
                  image: 'https:${data[0].hour[22].condition.icon}',
                  jam: jamMalam)
            ]),
          ],
        ),
      ),
    );
  }
}
