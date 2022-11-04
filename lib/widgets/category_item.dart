// Motive - It will output as SIngle Category Output in Grid of Output
/*
  Points :- Navigator acts like a Stack(Push & Pop)
*/
// ignore_for_file: unused_import, sort_child_properties_last


import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  String id;
  String title;
  Color color;
  CategoryItem({required this.id,required this.title, required this.color});

  void selectCategory(BuildContext ctx)
  {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id':id,
        'title':title,
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.titleMedium,),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
