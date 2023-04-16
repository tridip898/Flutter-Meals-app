import 'package:flutter/material.dart';
import 'package:meals_app/screen/drawer_screen.dart';

class FilterScreen extends StatefulWidget {
  final Function(Map<String, bool>) saveFilter;
  final Map<String,bool> currentFilters;
  const FilterScreen({Key? key, required this.saveFilter, required this.currentFilters}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _glutenFree = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree=widget.currentFilters['gluten']!;
    _lactoseFree=widget.currentFilters['lactose']!;
    _isVegetarian=widget.currentFilters['vegetarian']!;
    _isVegan=widget.currentFilters['vegan']!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            elevation: 0,
            title: Text(
              "Filter",
              style: TextStyle(fontSize: 20),
            ),
            actions:<Widget> [
              IconButton(onPressed: (){
                final selectedFilter={
                  'gluten':_glutenFree,
                  'vegan':_isVegan,
                  'vegetarian':_isVegetarian,
                  'lactose':_lactoseFree
                };
                widget.saveFilter(selectedFilter);
              }, icon: Icon(Icons.save))
            ],
          ),
          drawer: MainDrwaer(),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Adjust your meal",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  margin: EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      SwitchListTile(
                          value: _glutenFree,
                          onChanged: (val) {
                            setState(() {
                              _glutenFree = val;
                            });
                          },
                        title: Text("Gluten-Free",style: TextStyle(fontSize: 22,),),
                      ),
                      SwitchListTile(
                        value: _isVegan,
                        onChanged: (val) {
                          setState(() {
                            _isVegan = val;
                          });
                        },
                        title: Text("Vegan",style: TextStyle(fontSize: 22,),),
                      ),
                      SwitchListTile(
                        value: _isVegetarian,
                        onChanged: (val) {
                          setState(() {
                            _isVegetarian = val;
                          });
                        },
                        title: Text("Vegetarian",style: TextStyle(fontSize: 22,),),
                      ),
                      SwitchListTile(
                        value: _lactoseFree,
                        onChanged: (val) {
                          setState(() {
                            _lactoseFree = val;
                          });
                        },
                        title: Text("Lactose-Free",style: TextStyle(fontSize: 22,),),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
