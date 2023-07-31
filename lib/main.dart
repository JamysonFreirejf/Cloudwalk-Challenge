import 'package:cloudwalk_challenge/features/home/bloc/home_bloc.dart';
import 'package:cloudwalk_challenge/features/home/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app_routes.dart';
import 'core/utilities/provider/app_path_provider.dart';
import 'features/details/bloc/details_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPathProvider.initPath();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => DetailsBloc(),
        ),
      ],
      child: const AppSetUp(),
    );
  }
}

class AppSetUp extends StatefulWidget {
  const AppSetUp({super.key});

  @override
  State<AppSetUp> createState() => _AppSetUpState();
}

class _AppSetUpState extends State<AppSetUp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: const HomePage(),
      routes: AppRoutes.builder,
    );
  }
}
