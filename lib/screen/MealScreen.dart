import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/MealItemScreen.dart';
import 'package:meals/widgets/Meal_Item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.meals, required this.title});

  final String title;
  final List<Meal> meals;

  Void onClickOnMealItem(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealItemScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
              meal: meals[index],
            ));

    if (meals.isEmpty) {
      screen = Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Ohh no, no meals found',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Try adding some meals',
            style: TextStyle(fontSize: 16),
          ),
        ]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: screen,
    );
  }
}
