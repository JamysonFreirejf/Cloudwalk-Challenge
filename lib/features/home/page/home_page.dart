import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/app_routes.dart';
import '../../../core/models/tourPlaces/tour_place.dart';
import '../../../core/utilities/bloc/bloc_state.dart';
import '../../details/bloc/details_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../components/home_list_cell.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(GetListEvent());
  }

  Widget _searchField() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.primary.withOpacity(0.5),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          onChanged: (value) => _bloc.add(SearchEvent(query: value)),
          decoration: const InputDecoration(
            hintText: 'Search by city name',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _content(List<TourPlace> list) {
    return Column(
      children: [
        _searchField(),
        Expanded(
          child: _listContent(list),
        ),
      ],
    );
  }

  ListView _listContent(List<TourPlace> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return HomeListCell(
          index: index,
          content: list[index],
          onTap: () {
            BlocProvider.of<DetailsBloc>(context).setTourPlace(list[index]);
            Navigator.of(context).pushNamed(
              RouteName.details,
            );
          },
        );
      },
    );
  }

  BlocBuilder _builder() {
    return BlocBuilder<HomeBloc, BlocState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is SuccessfullyLoadedContentState<List<TourPlace>>) {
          return _content(state.content);
        }
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: _builder(),
    );
  }
}
