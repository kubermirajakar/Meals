import 'package:flutter/material.dart';
import 'package:meals/screen/BottomNavigationTabs.dart';

import 'package:meals/screen/CategoriesScreen.dart';
import 'package:meals/screen/MealScreen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: BottomNavigationTab(),
      // home: MealScreen(meals: [], title: 'Hello'),
    );
  }
}
