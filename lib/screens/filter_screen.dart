// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:meal_app_1/widgets/main_drawer.dart';
class FiltersScreen extends StatefulWidget {
  static const routeName='/filters';
  final dynamic saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree  = false;
  bool _vegetarian  = false;
  bool _vegan       = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree=widget.currentFilters['gluten'] as bool;
    _lactoseFree=widget.currentFilters['lactose'] as bool;
    _vegetarian=widget.currentFilters['vegetarian'] as bool;
    _vegan=widget.currentFilters['vegan'] as bool;
    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    void Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged:  updateValue
    );
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(onPressed: (){
            final selectedFilters={
              'gluten':_glutenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,
            };
            widget.saveFilters(selectedFilters);
            }, icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your meal selection.',style: Theme.of(context).textTheme.subtitle1),
        ),
        Expanded(
          child: ListView(
            children: [
                SwitchListTile(
                  title: Text("Gluten-Free "),
                  subtitle: Text('Only include Gluten-Free Meals'),
                  value: _glutenFree, 
                  onChanged: (newValue)
                  {
                    setState(() {
                      _glutenFree=newValue;
                    });
                  }
                  ),
                SwitchListTile(
                  title: Text("Lactose-Free "),
                  subtitle: Text("Only include Lactose-Free Meals"),
                  value: _lactoseFree, 
                  onChanged: (newValue)
                  {
                    setState(() {
                      _lactoseFree=newValue;
                    });
                  }
                  ),
                SwitchListTile(
                  title: Text("Vegetarian"),
                  subtitle: Text("Only include Vegetarian Meals"),
                  value: _vegetarian, 
                  onChanged: (newValue)
                  {
                    setState(() {
                      _vegetarian=newValue;
                    });
                  }
                  ),
                SwitchListTile(
                  title: Text("Vegan"),
                  subtitle: Text("Only include Vegan Meals"),
                  value: _vegan, 
                  onChanged: (newValue)
                  {
                    setState(() {
                      _vegan=newValue;
                    });
                  }
                  ),
            ],
          ),
        )
      ],)
      );  
  }
} 