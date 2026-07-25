import 'package:flutter/material.dart';
import 'package:meals/data/filters.dart';
import 'package:meals/widgets/filter_item.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters"), centerTitle: false),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 8, 0),
        child: Column(
          children: [
            ...filters.map(
              (filter) => FilterItem(
                key: Key(filter.id),
                id: filter.id,
                filterType: filter.filterType,
                filterDescription: filter.filterDescription,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
