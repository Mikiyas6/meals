import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/data/meal.dart';
import 'package:meals/widgets/meal_item.dart';
// import 'package:meals/data/dummy_data.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.title,
    required this.id,
    required this.saveToFavorites,
    required this.isFavorite,
    required this.filteredMeals,
    this.favorites = const [],
  });
  const MealScreen.favorite({
    super.key,
    required this.title,
    required this.id,
    required this.saveToFavorites,
    required this.isFavorite,
    required this.favorites,
    this.filteredMeals = const [],
  });

  final String title;
  final String id;
  final Function saveToFavorites;
  final Function isFavorite;
  final List<String> favorites;
  final List<Meal> filteredMeals;
  @override
  Widget build(BuildContext context) {
    List<Meal> meals = filteredMeals
        .where((meal) => meal.categories.contains(id))
        .toList();
    List<Meal> favoriteMeals = dummyMeals
        .where((meal) => favorites.contains(meal.id))
        .toList();

    if (title == "Favorites") {
      return MealItem(
        meals: favoriteMeals,
        saveToFavorites: saveToFavorites,
        isFavorite: isFavorite,
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: false),
      body: MealItem(
        meals: meals,
        saveToFavorites: saveToFavorites,
        isFavorite: isFavorite,
      ),
    );
  }
}
