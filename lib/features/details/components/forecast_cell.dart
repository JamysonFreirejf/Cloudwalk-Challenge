import 'package:flutter/material.dart';
import '../models/weather_data.dart';

class ForecastCell extends StatelessWidget {
  const ForecastCell({
    Key? key,
    required this.content,
  }) : super(key: key);

  final WeatherData content;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              content.formattedDate,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            content.highLowTemp,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
