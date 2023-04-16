import 'package:flutter/material.dart';
import '../model/meal_model.dart';
import '../widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeals;
  FavoriteScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("Favorite Screen",style: TextStyle(fontSize: 20),),
          ),
        ),
      );
    }else{
      return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: favoriteMeals.length,
          itemBuilder: (_,index){
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
            );
          });
    }
  }
}
