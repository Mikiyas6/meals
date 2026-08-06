import 'package:flutter/material.dart';
import 'package:meals/data/filters.dart';
import 'package:meals/widgets/filter_item.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, this.filters});

  final Map<Filters, bool>? filters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filters { isGlutenFree, isLactoseFree, isVegetarian, isVegan }

class _FiltersScreenState extends State<FiltersScreen> {
  bool? isGlutenFree;
  bool? isLactoseFree;
  bool? isVegetarian;
  bool? isVegan;
  Map<Filters, bool> activeFilters = <Filters, bool>{};

  @override
  void initState() {
    activeFilters = widget.filters!;
    isGlutenFree = activeFilters[Filters.isGlutenFree];
    isLactoseFree = activeFilters[Filters.isLactoseFree];
    isVegetarian = activeFilters[Filters.isVegetarian];
    isVegan = activeFilters[Filters.isVegan];
    super.initState();
  }

  void togglePressed(int index, bool value) {
    var name = activeFilters.keys.toList()[index].name;
    switch (name) {
      case "isGlutenFree":
        setState(() {
          isGlutenFree = value;
        });
        break;
      case "isLactoseFree":
        setState(() {
          isLactoseFree = value;
        });
        break;
      case "isVegetarian":
        setState(() {
          isVegetarian = value;
        });
        break;
      case "isVegan":
        setState(() {
          isVegan = value;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    activeFilters = {
      Filters.isGlutenFree: isGlutenFree!,
      Filters.isLactoseFree: isLactoseFree!,
      Filters.isVegetarian: isVegetarian!,
      Filters.isVegan: isVegan!,
    };
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.of(context).pop(activeFilters);
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Your Filters"), centerTitle: false),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 8, 0),
          child: ListView.builder(
            itemCount: activeFilters.length,
            itemBuilder: (context, index) {
              final filterValue = activeFilters.values.toList();
              return FilterItem(
                filterType: filters[index].filterType,
                filterDescription: filters[index].filterDescription,
                index: index,
                onTogglePressed: togglePressed,
                isToggleOn: filterValue[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
