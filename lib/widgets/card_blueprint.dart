import 'package:flutter/material.dart';

class CardBlueprint extends StatelessWidget {
  final Widget child;
  const CardBlueprint({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 8,
      shadowColor: Colors.pink,
      child: child,
    );
  }
}
