import 'package:flutter/material.dart';

import '../widgets/calculate_recalculate_button.dart';
import '../widgets/card_blueprint.dart';

class ResultScreen extends StatelessWidget {
  final double? bmiValue;
  final String bmiCategories;
  final String bmiDescription;
  const ResultScreen(
      {super.key,
      this.bmiValue,
      required this.bmiCategories,
      required this.bmiDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Result'),
      ),
      body: Column(
        children: [
          Text(
            'Your BMI Result',
            style: Theme.of(context).textTheme.headline4,
          ),
          Expanded(
            child: CardBlueprint(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    bmiCategories,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmiValue!.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmiDescription,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => Navigator.pop(context),
            child: const CalculateRecalculateButton(isCalculate: false),
          ),
        ],
      ),
    );
  }
}
