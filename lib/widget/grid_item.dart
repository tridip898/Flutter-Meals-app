import 'package:flutter/material.dart';
import 'package:meals_app/screen/meal_category.dart';

class GridItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const GridItem({Key? key,required this.id, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/meal-category',arguments: {
          'title':title,
          'id':id
        });
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white,fontFamily: "Raleway"),),
        ),
      ),
    );
  }
}
