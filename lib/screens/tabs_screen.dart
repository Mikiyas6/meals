import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late int _selectedIndex;
  late List<String> favorites;
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
        setState(() {
          favorites.add(mealId);
        });
      } else {
        setState(() {
          favorites.remove(mealId);
        });
      }
    });
  }

  bool isFavorite(String id) {
    return favorites.contains(id);
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

              onTap: () {},
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
              onTap: () {},
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
