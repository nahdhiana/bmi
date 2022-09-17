import 'package:flutter/material.dart';

class CalculateRecalculateButton extends StatelessWidget {
  final bool isCalculate;
  const CalculateRecalculateButton({super.key, required this.isCalculate});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text(
            isCalculate ? 'Calculate Your BMI' : 'Recalculate',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
