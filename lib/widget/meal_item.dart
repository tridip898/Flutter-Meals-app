import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem({Key? key, required this.title, required this.imageUrl, required this.duration, required this.complexity, required this.affordability, required this.id}) : super(key: key);

  String get complexityTest{
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Medium:
        return 'Medium';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilitytest{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurius:
        return 'Luxurius';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize=MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed('/meal-detail-page',arguments: id);
      },
      child: Container(
        height: deviceSize.height*0.25,
        width: double.infinity,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: deviceSize.height*.07,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  ),
                  image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill)
                ),
              ),
            ),
            Positioned(
              bottom: deviceSize.height*0.10,
              right: 10,
              child: Container(
                  width: deviceSize.width*0.60,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Text(title,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),overflow: TextOverflow.fade,softWrap: true,)),
            ),
            Positioned(
              bottom: 15,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                     children: [
                       Icon(Icons.schedule,color: Colors.grey.shade600,size: 26,),
                       SizedBox(width: 5,),
                       Text('$duration min',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                     ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work,color: Colors.grey.shade600,size: 26,),
                      SizedBox(width: 5,),
                      Text(complexityTest,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_outlined,color: Colors.grey.shade600,size: 26,),
                      SizedBox(width: 5,),
                      Text(affordabilitytest,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
