import 'package:flutter/material.dart';
import 'package:meals/data/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meals});
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
                    builder: (context) => MealDetailsScreen(meal: meals[index]),
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
                          horizontal: 44,
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
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              softWrap: true,
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


// Container(
//               margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//               height: 195,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(meals[index].imageUrl),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(200, 0, 0, 0),
//                     ),
//                     padding: EdgeInsets.all(6),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       spacing: 2,
//                       children: [
//                         Text(
//                           meals[index].title,
//                           style: Theme.of(context).textTheme.titleMedium
//                               ?.copyWith(
//                                 color: Theme.of(context).colorScheme.onSurface,
//                               ),
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Row(
//                               spacing: 5,
//                               children: [
//                                 Icon(Icons.timelapse_rounded),
//                                 Text(
//                                   '${meals[index].duration} min',
//                                   style: Theme.of(context).textTheme.bodyMedium!
//                                       .copyWith(
//                                         color: Theme.of(
//                                           context,
//                                         ).colorScheme.onSurface,
//                                       ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               spacing: 5,
//                               children: [
//                                 Icon(Icons.shopping_bag),
//                                 Text(
//                                   meals[index].complexity.name,
//                                   style: Theme.of(context).textTheme.bodyLarge!
//                                       .copyWith(
//                                         color: Theme.of(
//                                           context,
//                                         ).colorScheme.onSurface,
//                                       ),
//                                 ),
//                               ],
//                             ),

//                             Row(
//                               spacing: 5,
//                               children: [
//                                 Icon(Icons.attach_money),
//                                 Text(
//                                   meals[index].affordability.name,
//                                   style: Theme.of(context).textTheme.bodyLarge!
//                                       .copyWith(
//                                         color: Theme.of(
//                                           context,
//                                         ).colorScheme.onSurface,
//                                       ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),