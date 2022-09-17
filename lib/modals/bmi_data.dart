import 'dart:math';

class BmiData {
  final int weight;
  final double height;

  BmiData({required this.weight, required this.height});

  late double bmiValue;
  double calculateBmi() {
    return bmiValue = weight / pow((height / 100), 2);
  }

  static const _underweightSevere = 'Underweight (Severe thinness)';
  static const _underweightModerate = 'Underweight (Moderate thinness)';
  static const _underweightMild = 'Underweight (Mild thinness)';
  static const _normal = 'Normal Range';
  static const _overweight = 'Pre-Obese';
  static const _obese1 = 'Obese Class I';
  static const _obese2 = 'Obese Class II';
  static const _obese3 = 'Obese Class III';

  late String bmiCategories;
  late String bmiDesc;

  String categories(bmiValue) {
    if (bmiValue < 16.0) {
      bmiCategories = _underweightSevere;
    } else if (bmiValue < 17) {
      bmiCategories = _underweightModerate;
    } else if (bmiValue < 18.5) {
      bmiCategories = _underweightMild;
    } else if (bmiValue < 25) {
      bmiCategories = _normal;
    } else if (bmiValue < 30) {
      bmiCategories = _overweight;
    } else if (bmiValue < 35) {
      bmiCategories = _obese1;
    } else if (bmiValue < 40) {
      bmiCategories = _obese2;
    } else if (bmiValue >= 40) {
      bmiCategories = _obese3;
    }
    return bmiCategories;
  }

  String description(bmiCategory) {
    switch (bmiCategory) {
      case _underweightSevere:
      case _underweightModerate:
      case _underweightMild:
        bmiDesc = 'Possible Nutritional Deficiency and Osteoporosis.';
        break;
      case _normal:
        bmiDesc = 'Low Risk (Healthy Range)';
        break;
      case _overweight:
        bmiDesc =
            'Moderate Risk of Developing Heart Disease, High Blood Pressure, Stroke, Diabetes Mellitus.';
        break;
      case _obese1:
      case _obese2:
      case _obese3:
        bmiDesc =
            'High Risk of Developing Heart Disease, High Blood Pressure, Stroke, Diabetes Mellitus. Metabolic Syndrome.';
        break;
      default:
    }
    return bmiDesc;
  }
}
