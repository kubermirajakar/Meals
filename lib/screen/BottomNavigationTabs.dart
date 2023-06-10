import 'package:flutter/material.dart';
import 'package:meals/data/dummay_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/CategoriesScreen.dart';
import 'package:meals/screen/FilteredScreen.dart';
import 'package:meals/screen/MealScreen.dart';
import 'package:meals/widgets/Drawer.dart';

const kInitialFilters = {
  Filter.gluttenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

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
  Map<Filter, bool> _selectedFilters = kInitialFilters;

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

  void onSelectDrawerOption(String msg) async {
    if (msg == 'meals') {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilteredSCreen(selectedFilters: _selectedFilters),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.gluttenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget currentScreen = CategoriesSceen(
      availableMeals: availableMeals,
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
