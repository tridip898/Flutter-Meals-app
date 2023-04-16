import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';

import '../widget/meal_item.dart';

class MealCategory extends StatelessWidget {
  final List<Meal> availableMeals;
  const MealCategory({Key? key, required this.availableMeals,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    final catTitle=args['title'];
    final catID=args['id'];
    final categoryMeals=availableMeals.where((meal) {
      return meal.categories.contains(catID);
    }).toList();

    print(categoryMeals.length);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("${catTitle} Cuisine",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
            backgroundColor: Colors.teal,
          ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: categoryMeals.length,
            itemBuilder: (_,index){
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        })
      ),
    ));
  }
}
