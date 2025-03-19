import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  const ReusableCard({super.key, required this.colour, required this.child, required this.onPress});

  final Color colour;
  final Widget child;
  final Function onPress;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPress();
      },

      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: colour,
        ),
        child: child,
      ),
    );
  }
}