import 'package:flutter/material.dart';
import 'package:meals/data/dummay_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/MealScreen.dart';
import 'package:meals/widgets/category_grid_item.dart';

class categoriesSceen extends StatelessWidget {
  const categoriesSceen({super.key, required this.addFavoriteMeal});

  final void Function(Meal meal) addFavoriteMeal;
  void _selectCategory(BuildContext context, CategoryModel categoryModel) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryModel.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealScreen(
              meals: filteredMeals,
              title: categoryModel.title,
              addFavoriteMeal: addFavoriteMeal),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
      ),
      children: availableCategories
          .map((category) => CategoryGridItem(
                selectCategory: () {
                  _selectCategory(context, category);
                },
                categoryModel: category,
              ))
          .toList(),
    );
  }
}
