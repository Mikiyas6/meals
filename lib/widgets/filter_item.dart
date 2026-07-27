import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  const FilterItem({
    super.key,
    required this.filterType,
    required this.filterDescription,
    required this.id,
    required this.onToggleGlutenFree,
    required this.onToggleLactoseFree,
    required this.onToggleVegetarian,
    required this.onToggleVegan,
    required this.getIsGlutenFree,
    required this.getIsLactoseFree,
    required this.getIsVegetarian,
    required this.getIsVegan,
  });
  final String filterType;
  final String filterDescription;
  final String id;
  final Function onToggleGlutenFree;
  final Function onToggleLactoseFree;
  final Function onToggleVegetarian;
  final Function onToggleVegan;
  final Function getIsGlutenFree;
  final Function getIsLactoseFree;
  final Function getIsVegetarian;
  final Function getIsVegan;
  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  late bool isGlutenFree = widget.getIsGlutenFree();
  late bool isLactoseFree = widget.getIsLactoseFree();
  late bool isVegetarian = widget.getIsVegetarian();
  late bool isVegan = widget.getIsVegan();

  @override
  void initState() {
    super.initState();
  }

  bool isToggleOn(String filterId) {
    switch (widget.id) {
      case "0":
        return isGlutenFree;
      case "1":
        return isLactoseFree;
      case "2":
        return isVegetarian;
      case "3":
        return isVegan;
      default:
        return false;
    }
  }

  void _togglePressed(String filterId) {
    switch (filterId) {
      case "0":
        {
          widget.onToggleGlutenFree();
          setState(() {
            isGlutenFree = widget.getIsGlutenFree();
          });
        }
        break;
      case "1":
        {
          widget.onToggleLactoseFree();
          setState(() {
            isLactoseFree = widget.getIsLactoseFree();
          });
        }
        break;
      case "2":
        {
          widget.onToggleVegetarian();
          setState(() {
            isVegetarian = widget.getIsVegetarian();
          });
        }
        break;
      case "3":
        {
          widget.onToggleVegan();
          setState(() {
            isVegan = widget.getIsVegan();
          });
        }
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
          icon: isToggleOn(widget.id)
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
