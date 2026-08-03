import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/data/meal.dart';
import 'package:meals/widgets/meal_item.dart';
// import 'package:meals/data/dummy_data.dart';

/* 
 * We Can't define a const constructor for a class with non-final fields. If we want to have non-final fields, We have to make sure that every constructor we have is going to intialize all the final fields. But if some fields only make sense for certain constructors, we don't expect the users of the constructors to pass all the fields thus we can't make these fields to be required in the constructors. What we can do is, we can initialize the fields with an empty (String or List depending on the data type) so that we're not expecting the values to be passed from the user(They are not required) and they are also initialized since they are final fields.
 */

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.title,
    required this.id,
    required this.saveToFavorites,
    required this.isFavorite,
    required this.getFilteredMeals,
    this.favorites = const [],
  });
  const MealScreen.favorite({
    super.key,
    required this.title,
    required this.id,
    required this.saveToFavorites,
    required this.isFavorite,
    required this.favorites,
  }) : getFilteredMeals = _emptyMeals;

  final String title;
  final String id;
  final Function saveToFavorites;
  final Function isFavorite;
  final List<String> favorites;
  final Function getFilteredMeals;
  static List<Meal> _emptyMeals() => [];

  @override
  Widget build(BuildContext context) {
    if (title == "Favorites") {
      List<Meal> favoriteMeals = dummyMeals
          .where((meal) => favorites.contains(meal.id))
          .toList();

      return MealItem(
        meals: favoriteMeals,
        saveToFavorites: saveToFavorites,
        isFavorite: isFavorite,
      );
    }

    List<Meal> meals = getFilteredMeals();
    var newMeals = meals.where((meal) => meal.categories.contains(id)).toList();
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: false),
      body: MealItem(
        meals: newMeals,
        saveToFavorites: saveToFavorites,
        isFavorite: isFavorite,
      ),
    );
  }
}
