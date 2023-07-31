import 'package:cloudwalk_challenge/features/details/page/details_page.dart';
import 'package:flutter/material.dart';
import '../features/home/page/home_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> builder = {
    RouteName.home: (context) => const HomePage(),
    RouteName.details: (context) => const DetailsPage(),
  };
}

class RouteName {
  static const String home = 'home';
  static const String details = 'details';
}
