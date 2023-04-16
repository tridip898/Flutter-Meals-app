import 'package:flutter/material.dart';

class BuildContainer extends StatelessWidget {
  final Widget child;
  const BuildContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(left: 10,right: 10),
      padding: EdgeInsets.only(top: 5),
      child: child
    );
  }
}
