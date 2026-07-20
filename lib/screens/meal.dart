import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/data/meal.dart';
import 'package:meals/widgets/meal_item.dart';
// import 'package:meals/data/dummy_data.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.title, required this.id});
  final String title;
  final String id;
  @override
  Widget build(BuildContext context) {
    List<Meal> filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(id))
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: false),
      body: MealItem(meals: filteredMeals),
    );
  }
}
