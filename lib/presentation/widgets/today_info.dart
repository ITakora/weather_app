import 'package:flutter/material.dart';

class TodayWidget extends StatelessWidget {
  const TodayWidget(
      {super.key, required this.suhu, required this.image, required this.jam});
  final String suhu;
  final String image;
  final String jam;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          suhu,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Image.network(
          image,
          height: 65,
          width: 65,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          jam,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
