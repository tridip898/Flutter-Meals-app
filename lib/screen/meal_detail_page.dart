import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/widget/build_container.dart';
import 'package:meals_app/widget/selection_title_text.dart';

class MealDetailPage extends StatelessWidget {
  final Function toggleFavorite;
  final Function isMealFavorite;
  const MealDetailPage({Key? key, required this.toggleFavorite, required this.isMealFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize=MediaQuery.of(context).size;
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    final mealDetail=mealModel.firstWhere((meal) {
      return meal.id==mealId;
    });
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(mealDetail.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: deviceSize.height*0.27,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(mealDetail.imageUrl),fit: BoxFit.fill),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)
                      )
                  ),
                ),
                Positioned(
                  left: deviceSize.width*0.10,
                  right: deviceSize.width*0.10,
                  bottom: 20,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(mealDetail.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),overflow: TextOverflow.fade,softWrap: true,),
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  ),
                )
              ]
            ),
            SelectionTitle(text: "Ingredient"),
            BuildContainer(child: ListView.builder(
                itemCount: mealDetail.ingredients.length,
                itemBuilder: (_,index){
                  return Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(mealDetail.ingredients[index],style: TextStyle(fontSize: 18),),
                    ),
                  );
                }),),
            SelectionTitle(text: "Steps"),
            BuildContainer(child: ListView.separated(
                itemCount: mealDetail.steps.length,
                separatorBuilder: (context,index)=>Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                itemBuilder: (_,index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pinkAccent,
                  radius: 22,
                  child: Text("#${index+1}",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
                ),
                title: Text(mealDetail.steps[index],style: TextStyle(fontSize: 18),overflow: TextOverflow.fade,softWrap: true,maxLines: 1,),
              );
            }))

          ],
        ),
      ),
          floatingActionButton: FloatingActionButton(onPressed:()=> toggleFavorite(mealId),
            backgroundColor: Colors.pinkAccent,
            child: Icon(isMealFavorite(mealId) ? Icons.star:Icons.star_border,size: 2,color: Colors.white,),),
    ));
  }
}
