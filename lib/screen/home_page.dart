import 'package:flutter/material.dart';
import '../model/category_model.dart';
import '../widget/grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.3,crossAxisSpacing: 20,mainAxisSpacing: 20),
              itemCount: category.length,
              itemBuilder: (context,index){
            return GridItem(id: category[index].id,title: category[index].title,color: category[index].color,);
          }),
        ),
        ),
    );
  }
}
