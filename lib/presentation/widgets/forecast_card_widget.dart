import 'package:cuaca/data/models/forecast_day_model.dart';
import 'package:cuaca/presentation/widgets/forecast_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key, required this.data});
  final List<ForecastDay> data;

  @override
  Widget build(BuildContext context) {
    final hariPertama = DateFormat('EEEE, d', 'id_ID').format(data[1].date);
    final hariKedua = DateFormat('EEEE, d', 'id_ID').format(data[2].date);
    final hariKetiga = DateFormat('EEEE, d', 'id_ID').format(data[3].date);
    final hariKeempat = DateFormat('EEEE, d', 'id_ID').format(data[4].date);
    final hariKelima = DateFormat('EEEE, d', 'id_ID').format(data[5].date);

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 203, 229, 238),
          Color.fromARGB(160, 202, 220, 226),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      width: 370,
      height: 450,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(children: [
          const ListTile(
            title: Text(
              'Next Forecast',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              ForecastInfo(
                  day: hariPertama,
                  image: 'https:${data[1].day.condition.icon}',
                  suhu: '${data[1].day.avgtempC.toString()} C'),
              const SizedBox(height: 10),
              ForecastInfo(
                  day: hariKedua,
                  image: 'https:${data[2].day.condition.icon}',
                  suhu: '${data[2].day.avgtempC.toString()} C'),
              const SizedBox(height: 10),
              ForecastInfo(
                  day: hariKetiga,
                  image: 'https:${data[3].day.condition.icon}',
                  suhu: '${data[3].day.avgtempC.toString()} C'),
              const SizedBox(height: 10),
              ForecastInfo(
                  day: hariKeempat,
                  image: 'https:${data[4].day.condition.icon}',
                  suhu: '${data[4].day.avgtempC.toString()} C'),
              const SizedBox(height: 10),
              ForecastInfo(
                  day: hariKelima,
                  image: 'https:${data[5].day.condition.icon}',
                  suhu: '${data[5].day.avgtempC.toString()} C'),
              const SizedBox(height: 10),
            ],
          )
        ]),
      ),
    );
  }
}
