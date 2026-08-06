import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  const FilterItem({
    super.key,
    required this.filterType,
    required this.filterDescription,
    required this.onTogglePressed,
    required this.isToggleOn,
    required this.index,
  });
  final String filterType;
  final String filterDescription;
  final Function onTogglePressed;
  final bool isToggleOn;
  final int index;

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        widget.filterType,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        widget.filterDescription,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),

      value: widget.isToggleOn,
      onChanged: (value) {
        widget.onTogglePressed(widget.index, value);
      },
    );
  }
}
