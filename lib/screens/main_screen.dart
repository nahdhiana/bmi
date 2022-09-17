import 'package:flutter/material.dart';

import '../modals/bmi_data.dart';
import '../screens/result_screen.dart';
import '../widgets/calculate_recalculate_button.dart';
import '../widgets/card_blueprint.dart';
import '../widgets/main_gender.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

enum Gender { male, female }

class _MainScreenState extends State<MainScreen> {
  double height = 140;
  int weight = 45;
  int age = 25;
  Gender gender = Gender.male;
  bool isMaleSelected = true;
  bool isFemaleSelected = false;

  ScaffoldFeatureController snackbarAgeWeight(isAge) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cannot Decrease ${isAge ? 'Age' : 'Weight'} Anymore!'),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  Widget ageWeightSection(isAgeSection) {
    return Expanded(
      child: CardBlueprint(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              isAgeSection ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline4,
            ),
            RichText(
              text: TextSpan(
                text: isAgeSection ? age.toString() : weight.toString(),
                style: Theme.of(context).textTheme.headline5,
                children: [
                  TextSpan(
                    text: isAgeSection ? ' Years' : ' Kg',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    if (isAgeSection) {
                      age > 0 ? age-- : snackbarAgeWeight(true);
                    } else {
                      weight > 0 ? weight-- : snackbarAgeWeight(false);
                    }
                    setState(() {});
                  },
                  tooltip: 'Decrease ${isAgeSection ? 'Age' : 'Weight'}',
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    isAgeSection ? age++ : weight++;
                    setState(() {});
                  },
                  tooltip: 'Increase  ${isAgeSection ? 'Age' : 'Weight'}',
                  splashColor: Colors.red,
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.pink,
                    highlightColor: Colors.pinkAccent,
                    onTap: () {
                      isMaleSelected = !isMaleSelected;
                      if (isMaleSelected) {
                        isFemaleSelected = false;
                        gender = Gender.male;
                      } else {
                        isFemaleSelected = true;
                        gender = Gender.female;
                      }
                      setState(() {});
                    },
                    child: GenderChoice(
                      gender: Gender.male,
                      icon: Icons.male,
                      isSelected: isMaleSelected,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.pink,
                    highlightColor: Colors.pinkAccent,
                    onTap: () {
                      isFemaleSelected = !isFemaleSelected;
                      if (isFemaleSelected) {
                        isMaleSelected = false;
                        gender = Gender.female;
                      } else {
                        isMaleSelected = true;
                        gender = Gender.male;
                      }
                      setState(() {});
                    },
                    child: GenderChoice(
                      gender: Gender.female,
                      icon: Icons.female,
                      isSelected: isFemaleSelected,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardBlueprint(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Height',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  RichText(
                    text: TextSpan(
                      text: height.toStringAsFixed(0),
                      style: Theme.of(context).textTheme.headline5,
                      children: [
                        TextSpan(
                          text: ' CM',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    activeColor: Colors.grey,
                    thumbColor: Colors.pink,
                    min: 130,
                    max: 210,
                    value: height,
                    onChanged: (heightValue) {
                      height = heightValue;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ageWeightSection(false),
                ageWeightSection(true),
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              BmiData bmiData = BmiData(height: height, weight: weight);
              double bmiValue = bmiData.calculateBmi();
              String bmiCategories = bmiData.categories(bmiValue);
              String bmiDesc = bmiData.description(bmiCategories);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmiValue: bmiValue,
                    bmiCategories: bmiCategories,
                    bmiDescription: bmiDesc,
                  ),
                ),
              );
            },
            child: const CalculateRecalculateButton(isCalculate: true),
          ),
        ],
      ),
    );
  }
}
