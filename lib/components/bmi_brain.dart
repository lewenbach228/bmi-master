import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    required this.height,
    required this.weight,
  });

  final int height;
  final int weight;

  double _bmi = 20.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Surpoids';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return ' Perte de Poids';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "Votre masse corporelle est supérieur à la normale. Essayer de faire un peu d'exercise";
    } else if (_bmi > 18.5) {
      return 'Vous avez une masse corporelle à la norme. Félicitations!';
    } else {
      return 'Votre masse corporelle est asez faible, Essayer de manger plus!';
    }
  }
}
