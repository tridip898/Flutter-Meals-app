import 'package:flutter/material.dart';
import '../screen/drawer_screen.dart';
import '../screen/favorite_screen.dart';
import '../model/meal_model.dart';
import '../screen/home_page.dart';

class BottomNavScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const BottomNavScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late List<Map<String,Object>> _page;
  int _currentIndex=0;
  void changeIndex(int index){
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  void initState() {
    _page=[
      {'page': HomePage(),'title':'Categories'},
      {'page': FavoriteScreen(favoriteMeals: widget.favoriteMeals),'title':'Favorite Items'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 0,
          title: Text(_page[_currentIndex]['title'] as String,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
        ),
        drawer: MainDrwaer(),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.pinkAccent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade300,
            selectedFontSize: 20,
            unselectedFontSize: 18,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            iconSize: 26,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: changeIndex,
            items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
        ]),
        body: _page[_currentIndex]['page'] as Widget,
      ),
    );
  }
}
