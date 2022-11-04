/*
  Points :  1.Catrgory Id( final categoryId=routeArgs['id']) should match Meals Id in order to show
*/


import 'package:flutter/material.dart';
import '../widgets/meals_item.dart';
import '../models/meal.dart';
import '../dummy_data.dart';


class CategoryMealsScreen extends StatelessWidget {
  static const routeName='/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId,this.categoryTitle);
  
  @override
  Widget build(BuildContext context) {
      final routeArgs=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
      final categoryTitle=routeArgs['title'];
      final categoryId=routeArgs['id'];

      // Filtering (CategorId==MealsId) to Show on App
      final categoryMeals=availableMeals.where((meal)
      {
        return meal.categories.contains(categoryId);

      }).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(itemBuilder:  ((ctx, index) 
        {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title, 
            imageUrl: categoryMeals[index].imageUrl, 
            affordability: categoryMeals[index].affordability, 
            complexity: categoryMeals[index].complexity, 
            duration: categoryMeals[index].duration);
        }),
        itemCount: categoryMeals.length,
        )
        
      );   
  }
} 