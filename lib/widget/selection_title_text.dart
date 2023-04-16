import 'package:flutter/material.dart';

class SelectionTitle extends StatelessWidget {
  final String text;
  const SelectionTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
      child: Text(text,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
    );
  }
}
