import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.saveToFavorites,
    required this.isFavorite,
  });
  final Function saveToFavorites;
  final Function isFavorite;
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.5,
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      children: [
        ...availableCategories.map(
          (category) => CategoryGridItem(
            category: category,
            saveToFavorites: saveToFavorites,
            isFavorite: isFavorite,
          ),
        ),
      ],
    );
  }
}
