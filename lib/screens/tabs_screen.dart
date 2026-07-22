import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  void selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? "Categories" : "Favorites"),
        centerTitle: false,
      ),
      body: _selectedIndex == 0
          ? CategoriesScreen()
          : MealScreen(title: "Favorites", id: "c99"),
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
