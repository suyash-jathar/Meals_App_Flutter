import 'package:flutter/foundation.dart';

enum Complexity{
  Simple,
  Challenging,
  Hard
}
enum Affordability{
  Affordable,
  Pricey,
  Luxurious,
}

class Meal{
  final String id;//to identify
  final List<String> categories;//to identify category
  final String title;//to Give title to meal
  final String imageUrl;//to Give image to meal
  final List<String> ingredients;//to Give ingredients to meal
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    }
    );
  
  
}


