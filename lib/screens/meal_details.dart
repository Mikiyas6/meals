import 'package:flutter/material.dart';
import 'package:meals/data/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.saveToFavorites,
    required this.isFavorite,
  });

  final Meal meal;
  final Function saveToFavorites;
  final Function isFavorite;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  var isFavorited;
  @override
  void initState() {
    isFavorited = widget.isFavorite(widget.meal.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              widget.saveToFavorites(widget.meal.id);
              setState(() {
                isFavorited = !isFavorited;
              });
            },
            icon: Icon(isFavorited ? Icons.star : Icons.star_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(widget.meal.imageUrl),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Ingredients",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 15),
                  ...widget.meal.ingredients.map(
                    (ingredient) => Column(
                      children: [
                        Text(
                          ingredient,
                          style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Steps",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 20),
                  ...widget.meal.steps.map(
                    (ingredient) => Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          softWrap: true,
                          ingredient,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
