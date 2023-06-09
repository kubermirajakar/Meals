import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/CategoriesScreen.dart';
import 'package:meals/screen/FilteredScreen.dart';
import 'package:meals/screen/MealScreen.dart';
import 'package:meals/widgets/Drawer.dart';

class BottomNavigationTab extends StatefulWidget {
  @override
  State<BottomNavigationTab> createState() {
    // TODO: implement createState
    return _BottomNavigationTabState();
  }
}

class _BottomNavigationTabState extends State<BottomNavigationTab> {
  int _selectedPage = 0;

  List<Meal> favoritesMeals = [];

  void showFeedBack(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text(msg),
      ),
    );
  }

  void addFavoriteMeal(Meal meal) {
    if (favoritesMeals.contains(meal)) {
      setState(() {
        favoritesMeals.remove(meal);
      });
      showFeedBack('Meal removed from favorites');
    } else {
      setState(() {
        favoritesMeals.add(meal);
      });
      showFeedBack('Meal added to favorites');
    }
  }

  void selectedCategory(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void onSelectDrawerOption(String msg) {
    if (msg == 'meals') {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => FilteredSCreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = categoriesSceen(
      addFavoriteMeal: addFavoriteMeal,
    );
    String activePageTite = 'Categories';

    if (_selectedPage == 1) {
      currentScreen = MealScreen(
        addFavoriteMeal: addFavoriteMeal,
        meals: favoritesMeals,
      );
      activePageTite = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTite),
      ),
      drawer: MainDrawer(onSelectDrawerOption: onSelectDrawerOption),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedCategory,
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
