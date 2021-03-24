

import 'package:flutter/material.dart';
import 'package:i_am_reach/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  static const String  routeName = 'mealDetail';

  Widget buildSectionTitle(BuildContext context , String text){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text , style: Theme.of(context).textTheme.title,),
    );
  }

  Widget buildContainer(Widget child){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child
    );
  }


  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);


    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title +" details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl , fit: BoxFit.cover,),
            ),
            buildSectionTitle(context, 'Ingredients'),

            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    child: Text("${index+1}"  , style: TextStyle(color: Colors.white),),
                  ),
                  title: Text(selectedMeal.steps[index] ),

                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}