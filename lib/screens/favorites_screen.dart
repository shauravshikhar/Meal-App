import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.favoriteMeals.isEmpty
        ? Center(
            child: Text('You have no favorites yet - start adding some!'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: widget.favoriteMeals[index].id,
                title: widget.favoriteMeals[index].title,
                imageUrl: widget.favoriteMeals[index].imageUrl,
                duration: widget.favoriteMeals[index].duration,
                complexity: widget.favoriteMeals[index].complexity,
                affordability: widget.favoriteMeals[index].affordability,
              );
            },
            itemCount: widget.favoriteMeals.length,
          );
  }
}
