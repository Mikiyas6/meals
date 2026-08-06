import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/data/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late int _selectedIndex;
  late List<String> favorites;
  Map<Filters, bool> filters = {
    Filters.isGlutenFree: false,
    Filters.isLactoseFree: false,
    Filters.isVegetarian: false,
    Filters.isVegan: false,
  };
  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    favorites = [];
  }

  void selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void saveToFavorites(String mealId) {
    setState(() {
      if (!favorites.contains(mealId)) {
        favorites.add(mealId);
      } else {
        favorites.remove(mealId);
      }
    });
  }

  List<Meal> filterMeals() {
    var meals = List.of(dummyMeals);
    var values = filters.values.toList();

    if (values[0]) {
      meals = meals.where((meal) => meal.isGlutenFree).toList();
    }

    if (values[1]) {
      meals = meals.where((meal) => meal.isLactoseFree).toList();
    }

    if (values[2]) {
      meals = meals.where((meal) => meal.isVegetarian).toList();
    }

    if (values[3]) {
      meals = meals.where((meal) => meal.isVegan).toList();
    }

    return meals;
  }

  bool isFavorite(String id) {
    return favorites.contains(id);
  }

  List<Meal> getFilteredMeals() {
    return filterMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.fastfood,
                      size: 40,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Cooking Up!",
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              selectedColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.restaurant),
              title: Text(
                "Meals",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              onTap: () async {
                Navigator.pop(context);
                final activeFilters = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FiltersScreen(filters: filters),
                  ),
                );
                setState(() {
                  filters = activeFilters;
                });
              },
              title: Text(
                "Filters",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? "Categories" : "Favorites"),
        centerTitle: false,
        actions: [
          if (_selectedIndex == 1 && favorites.isNotEmpty)
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  favorites = [];
                });
              },
              label: Text("Clear All"),
              icon: Icon(Icons.delete),
            ),
        ],
      ),
      body: _selectedIndex == 0
          ? CategoriesScreen(
              saveToFavorites: saveToFavorites,
              isFavorite: isFavorite,
              getFilteredMeals: getFilteredMeals,
              filter: filterMeals,
            )
          : MealScreen.favorite(
              title: "Favorites",
              id: "favorites",
              saveToFavorites: saveToFavorites,
              isFavorite: isFavorite,
              favorites: favorites,
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => {selectIndex(value)},
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.set_meal_outlined),
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: "Favorites",
            activeIcon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
