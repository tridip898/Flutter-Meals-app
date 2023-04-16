import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/screen/filter_screen.dart';
import 'package:meals_app/screen/meal_category.dart';
import 'package:meals_app/screen/meal_detail_page.dart';
import './screen/home_page.dart';
import './screen/bottom_navigation-screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters={
    'gluten':false,
    'vegan':false,
    'vegetarian':false,
    'lactose':false
  };
  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters=filterData;
      _availableMeals=mealModel.where((meal) {
        if(_filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose']! && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian']! && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meal> _availableMeals=mealModel;
  List<Meal> _favoriteMeals=[];

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id==id);
  }
  void _toggleFavorites(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) =>meal.id==mealId);
    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoriteMeals.add(mealModel.firstWhere((meal) => meal.id == mealId ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context)=>BottomNavScreen(favoriteMeals: _favoriteMeals),
        '/home': (context)=>HomePage(),
        '/meal-category': (context)=>MealCategory(availableMeals: _availableMeals),
        '/meal-detail-page': (context)=>MealDetailPage(toggleFavorite: _toggleFavorites, isMealFavorite:_isMealFavorite),
        '/filter-screen': (context)=>FilterScreen(saveFilter: _setFilters,currentFilters: _filters)
      },
    );
  }
}

