import 'package:flutter/material.dart';
import 'package:meals/data/dummay_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screen/MealScreen.dart';
import 'package:meals/widgets/category_grid_item.dart';

class categoriesSceen extends StatelessWidget {
  void _selectCategory(BuildContext context, CategoryModel categoryModel) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryModel.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MealScreen(meals: filteredMeals, title: categoryModel.title),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfffdfefe),
      appBar: AppBar(
        title: Text('Select your category'),
      ),
      body: GridView(
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
      ),
    );
  }
}
