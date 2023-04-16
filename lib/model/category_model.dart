import 'package:flutter/material.dart';

class CategoryModel{
  final String id;
  final String title;
  final Color color;

  CategoryModel({required this.id,required this.title,this.color=Colors.orangeAccent});
}

List<CategoryModel> category=[
  CategoryModel(id: "c1", title: "Italian",color: Colors.purple),
  CategoryModel(id: "c2", title: "Chinese",color: Colors.orangeAccent),
  CategoryModel(id: "c3", title: "Bengali",color: Colors.red),
  CategoryModel(id: "c4", title: "Indian",color: Colors.green),
  CategoryModel(id: "c5", title: "Mexican",color: Colors.indigoAccent),
  CategoryModel(id: "c6", title: "Thai",color: Colors.teal),
  CategoryModel(id: "c7", title: "Arabian",color: Colors.deepPurpleAccent),
  CategoryModel(id: "c8", title: "American",color: Colors.purpleAccent),
  CategoryModel(id: "c9", title: "Spanish",color: Colors.brown),
];