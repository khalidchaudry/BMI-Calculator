import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  CalculatorBrain({required this.height, required this.weight});
  double? _bmi;

  String bmiCalculate() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiResult() {
    if (_bmi! >= 25) {
      return 'OverWeight';
    } else if (_bmi! > 18) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'You are overweight try to diet!';
    } else if (_bmi! > 18) {
      return 'You have normal body weight. Good job!';
    } else {
      return 'Your body weight is less then normal try to eat more!';
    }
  }
}
