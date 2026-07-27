import 'package:flutter/material.dart';
import 'package:meals/data/meal.dart';
import 'package:meals/model/category.dart';
import 'package:meals/screens/meal.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.saveToFavorites,
    required this.isFavorite,
    required this.filteredMeals,
  });
  final Category category;
  final Function saveToFavorites;
  final Function isFavorite;
  final List<Meal> filteredMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(20),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MealScreen(
              title: category.title,
              id: category.id,
              isFavorite: isFavorite,
              saveToFavorites: saveToFavorites,
              filteredMeals: filteredMeals,
            ),
          ),
        ),
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
