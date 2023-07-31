import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utilities/bloc/bloc_state.dart';
import '../bloc/details_bloc.dart';
import '../bloc/details_event.dart';
import '../bloc/details_state.dart';
import '../components/forecast_cell.dart';
import '../components/weather_info_header.dart';
import '../models/weather_data.dart';
import '../models/weather_forecast_data.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DetailsBloc get _bloc => BlocProvider.of<DetailsBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(GetWeatherInfoEvent());
  }

  Widget _content(List<WeatherData> list, WeatherData? content) {
    return ListView.builder(
      itemCount: list.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return WeatherInfoHeader(content: content);
        }
        index -= 1;
        return ForecastCell(content: list[index]);
      },
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  Widget _empty() {
    return const Center(
      child: Text(
        'Something went wrong!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }

  BlocBuilder _builder() {
    return BlocBuilder<DetailsBloc, BlocState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is SuccessfullyLoadedContentState<WeatherForecastData>) {
          return _content(state.content.forecast, state.content.currentWeather);
        }
        if (state is DetailsLoadingState) {
          return _loading();
        }
        return _empty();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade300,
      appBar: AppBar(),
      body: _builder(),
    );
  }
}
