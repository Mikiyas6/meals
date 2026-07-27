import 'package:flutter/material.dart';
import 'package:meals/data/filters.dart';
import 'package:meals/widgets/filter_item.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.onToggleGlutenFree,
    required this.onToggleLactoseFree,
    required this.onToggleVegetarian,
    required this.onToggleVegan,
    required this.getIsGlutenFree,
    required this.getIsLactoseFree,
    required this.getIsVegetarian,
    required this.getIsVegan,
  });

  final Function onToggleGlutenFree;
  final Function onToggleLactoseFree;
  final Function onToggleVegetarian;
  final Function onToggleVegan;
  final Function getIsGlutenFree;
  final Function getIsLactoseFree;
  final Function getIsVegetarian;
  final Function getIsVegan;
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
                onToggleGlutenFree: widget.onToggleGlutenFree,
                onToggleLactoseFree: widget.onToggleLactoseFree,
                onToggleVegetarian: widget.onToggleVegetarian,
                onToggleVegan: widget.onToggleVegan,
                getIsGlutenFree: widget.getIsGlutenFree,
                getIsLactoseFree: widget.getIsLactoseFree,
                getIsVegetarian: widget.getIsVegetarian,
                getIsVegan: widget.getIsVegan,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
