import 'package:flutter/material.dart';

import '../screens/main_screen.dart';
import './card_blueprint.dart';

class GenderChoice extends StatelessWidget {
  const GenderChoice({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.gender,
  }) : super(key: key);

  final bool isSelected;
  final IconData icon;
  final Gender gender;

  @override
  Widget build(BuildContext context) {
    return CardBlueprint(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 50,
            color: isSelected ? Colors.pink : Colors.grey,
          ),
          Text(
            gender == Gender.male ? 'Male' : 'Female',
            style: TextStyle(
              color: isSelected ? Colors.pink : Colors.grey,
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}
