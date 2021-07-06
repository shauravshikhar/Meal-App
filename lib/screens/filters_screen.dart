import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget buildSwitchTile(
    String title,
    String description,
    bool currentValue,
    Function updateTitle,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateTitle,
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilter);
              }),
        ],
        title: Text(
          'Filters',
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchTile('gluten-free',
                    'includes only gluten-free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchTile(
                    'Vegetarian', 'includes only Vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                buildSwitchTile('Vegan', 'includes only Vegan meals', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                buildSwitchTile(
                    'Lactose-free',
                    'includes only Lactose-free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
