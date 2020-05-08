import 'package:flutter/material.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals == null || favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet.'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          var item = favoriteMeals[index];
          return MealItem(
            id: item.id,
            title: item.title,
            imageUrl: item.imageUrl,
            complexity: item.complexity,
            affordability: item.affordability,
            duration: item.duration,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }

  }
}
