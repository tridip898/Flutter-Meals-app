import 'package:flutter/material.dart';

class MainDrwaer extends StatelessWidget {
  const MainDrwaer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              accountName: Text(
                "Tridip Bhowmik",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text("tridip898@gmail.com"),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  "T",
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ), //Text
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ),
          ListTile(
            leading: Icon(Icons.restaurant,size: 25,),
            title: Text("Meals",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            tileColor: Colors.white,
            selectedTileColor: Colors.black12,
            onTap: (){
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,size: 25,),
            title: Text("Filter",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.of(context).pushNamed('/filter-screen');
            },
            tileColor: Colors.white,
            selectedTileColor: Colors.black12,
          )
        ],
      ),
    );
  }
}
