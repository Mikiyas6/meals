import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  const FilterItem({
    super.key,
    required this.filterType,
    required this.filterDescription,
    required this.id,
  });
  final String filterType;
  final String filterDescription;
  final String id;

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegetarian = false;
  bool isVegan = false;

  void onToggleGlutenFree() {
    setState(() {
      isGlutenFree = !isGlutenFree;
    });
  }

  void onToggleLactoseFree() {
    setState(() {
      isLactoseFree = !isLactoseFree;
    });
  }

  void onToggleVegetarian() {
    setState(() {
      isVegetarian = !isVegetarian;
    });
  }

  void onToggleVegan() {
    setState(() {
      isVegan = !isVegan;
    });
  }

  void _togglePressed(String filterId) {
    switch (widget.id) {
      case "0":
        onToggleGlutenFree();
        break;
      case "1":
        onToggleLactoseFree();
        break;
      case "2":
        onToggleVegetarian();
        break;
      case "3":
        onToggleVegan();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.filterType,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              widget.filterDescription,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),

        IconButton(
          onPressed: () {
            _togglePressed(widget.id);
          },
          icon: isGlutenFree || isLactoseFree || isVegan || isVegetarian
              ? Icon(
                  Icons.toggle_on,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                )
              : Icon(
                  Icons.toggle_off_outlined,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
        ),
      ],
    );
  }
}
