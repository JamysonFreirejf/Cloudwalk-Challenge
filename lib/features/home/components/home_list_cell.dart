import 'package:flutter/material.dart';
import '../../../core/models/tourPlaces/tour_place.dart';

class HomeListCell extends StatelessWidget {
  const HomeListCell({
    Key? key,
    required this.index,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final TourPlace content;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return ListTile(
      title: Text(content.description),
      trailing: const Icon(Icons.arrow_forward_ios),
      tileColor: index.isOdd ? oddItemColor : evenItemColor,
      onTap: () => onTap(),
    );
  }
}
