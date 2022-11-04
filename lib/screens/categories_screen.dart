// Points -   1. SliverGrid -Scrollable Areas in Screen
//            2. delegate-Structuring Grid

//          
import 'package:flutter/material.dart';
import 'package:meal_app_1/dummy_data.dart';
import '../widgets/category_item.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('DeliMeal'),
      // ),
      body: GridView(
        padding: EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2, //Ratio of height to width
          crossAxisSpacing: 20, //Distance between rows
          mainAxisSpacing: 40, //Distance between columns
        ),
        children: DUMMY_CATEGORIES
            .map((catData) =>
                CategoryItem(
                  id: catData.id,
                  title: catData.title, 
                  color: catData.color
                  ))
            .toList(),
      ),
    );
  }
}
