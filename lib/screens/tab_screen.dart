import "package:flutter/material.dart";
import 'package:meal_app_1/screens/categories_screen.dart';
import 'package:meal_app_1/screens/favorite_screen.dart';
import 'package:meal_app_1/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  List<Map<String, dynamic>> _pages=[];
  int _selectedpagesIndex=0;
  
  @override
  void initState() {
    _pages=[
    {
      'page':CategoriesScreen(),
      'title':'Categories',
    },
    {
      'page':FavoritesScreen(widget.favoriteMeals),
      'title':'Your Favorites',
    },
    
  ];  
    super.initState();
  }


// Flutter automatically gives index
  void _selectedpages(int index){
    setState(() {
      _selectedpagesIndex=index;
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return 
    // DefaultTabController(
    //   length: 2, 
    //   child: 
      Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedpagesIndex]['title']),
        // bottom: TabBar(
        //   // onTap: ,
        //   tabs: [
        //     Tab(icon: Icon(Icons.category),text: "Categories",),
        //     Tab(icon: Icon(Icons.star),text: "Favorites",),
        //   ],
        // ),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedpagesIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _selectedpagesIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          onTap: _selectedpages, 
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star),label: "Favorites"),
          ],
          ),
      );
      
  }
}