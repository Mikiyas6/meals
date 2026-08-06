import 'package:flutter/material.dart';
import 'package:meals/data/filters.dart';
import 'package:meals/widgets/filter_item.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filters { isGlutenFree, isLactoseFree, isVegetarian, isVegan }

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegetarian = false;
  var isVegan = false;
  var activeFilters = <Filters, bool>{};

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
      Filters.isGlutenFree: isGlutenFree,
      Filters.isLactoseFree: isLactoseFree,
      Filters.isVegetarian: isVegetarian,
      Filters.isVegan: isVegan,
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
