import 'package:flutter/material.dart';
import 'package:i_am_reach/screens/categories_screen.dart';
import 'package:i_am_reach/screens/category_meals_screen.dart';
import 'package:i_am_reach/screens/meal_detail_screen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    canvasColor: Color.fromRGBO(255, 254, 229, 1),
    textTheme: ThemeData.light().textTheme.copyWith(
      body1: TextStyle(
        color: Color.fromRGBO(20, 50, 50, 1)
      ),
      body2: TextStyle(
        color: Color.fromRGBO(20, 50, 50, 1)
      ),
      title: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,

      ),
    ),
  ),

  home: CategoriesScreen(),
  routes: {
    CategoryMealScreen.routeName : (context) => CategoryMealScreen(),
    MealDetailScreen.routeName : (context) => MealDetailScreen(),
  },

));


