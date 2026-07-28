import 'package:flutter/material.dart';
import 'package:meals/data/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meals,
    required this.saveToFavorites,
    required this.isFavorite,
  });
  final Function saveToFavorites;
  final Function isFavorite;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget mainContent = meals.isEmpty
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
            itemCount: meals.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MealDetailsScreen(
                      meal: meals[index],
                      saveToFavorites: saveToFavorites,
                      isFavorite: isFavorite,
                    ),
                  ),
                ),
              },
              child: Card(
                elevation: 2,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(meals[index].imageUrl),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 30,
                        ),
                        color: Colors.black54,
                        child: Column(
                          children: [
                            Text(
                              meals[index].title,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Row(
                                  spacing: 5,
                                  children: [
                                    Icon(Icons.schedule),
                                    Text(
                                      '${meals[index].duration} min',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 5,
                                  children: [
                                    Icon(Icons.shopping_bag),
                                    Text(
                                      meals[index].complexity.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 1,
                                  children: [
                                    Icon(Icons.attach_money),
                                    Text(
                                      meals[index].affordability.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
    return mainContent;
  }
}
