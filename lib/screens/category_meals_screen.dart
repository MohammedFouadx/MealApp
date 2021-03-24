
import 'package:flutter/material.dart';
import 'package:i_am_reach/dummy_data.dart';
import 'package:i_am_reach/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {


  static const routeName = "category_meals";

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  @override
  Widget build(BuildContext context) {

    final routeArg = ModalRoute.of(context).settings.arguments as Map<String , String>;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {

      return meal.categories.contains(categoryId);

    }).toList();


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index){
            return MealItem(
              id: categoryMeal[index].id,
              imageUrl: categoryMeal[index].imageUrl,
              title: categoryMeal[index].title,
              duration: categoryMeal[index].duration,
              complexity: categoryMeal[index].complexity,
              affordability: categoryMeal[index].affordability,
            );
          },
          itemCount: categoryMeal.length,
      ),
    );
  }
}
