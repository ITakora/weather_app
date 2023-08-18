import 'package:flutter/material.dart';

class ForecastInfo extends StatelessWidget {
  const ForecastInfo(
      {super.key, required this.day, required this.image, required this.suhu});
  final String day;
  final String image;
  final String suhu;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(day),
        Image.network(
          image,
          height: 65,
          width: 65,
        ),
        Text(suhu),
      ],
    );
  }
}
