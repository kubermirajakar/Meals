import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/CategoriesScreen.dart';
import 'package:meals/screen/MealScreen.dart';

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
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(.8),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.fastfood, size: 30),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cooking Up!',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.restaurant,
                  size: 25, color: Theme.of(context).colorScheme.onBackground),
              title: Text(
                'Meals',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.restaurant,
                  size: 25, color: Theme.of(context).colorScheme.onBackground),
              title: Text(
                'Meals',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
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
