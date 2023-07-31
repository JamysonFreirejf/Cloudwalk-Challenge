import 'package:flutter/material.dart';
import '../models/weather_data.dart';

class WeatherInfoHeader extends StatelessWidget {
  const WeatherInfoHeader({
    Key? key,
    required this.content,
  }) : super(key: key);

  final WeatherData? content;

  @override
  Widget build(BuildContext context) {
    if (content == null) {
      return Container();
    }
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                content!.cityName,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                content!.mainTemp,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                content!.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                content!.highLowTemp,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
