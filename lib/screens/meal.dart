import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/data/meal.dart';
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
    Widget mainContent = filteredMeals.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Oh oh.... Nothing Here!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  "Try selecting a different Category.",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: filteredMeals.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              height: 195,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(filteredMeals[index].imageUrl),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(200, 0, 0, 0),
                    ),
                    padding: EdgeInsets.all(6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 2,
                      children: [
                        Text(
                          filteredMeals[index].title,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              spacing: 5,
                              children: [
                                Icon(Icons.timelapse_rounded),
                                Text(
                                  '${filteredMeals[index].duration} min',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                Icon(Icons.shopping_bag),
                                Text(
                                  filteredMeals[index].complexity.name,
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                ),
                              ],
                            ),

                            Row(
                              spacing: 5,
                              children: [
                                Icon(Icons.attach_money),
                                Text(
                                  filteredMeals[index].affordability.name,
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: false),
      body: mainContent,
    );
  }
}
