import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight}); // Construtor

  int height; // propriedades
  int weight;

  double
      _bmi; // 2) Por isso, criar acima esse bmi privado, que vai ser calc pelo resultadoBMI

  // função para gerar e retornar o resultado da BMI com 1 casa decimal
  String resultadoBMI() {
    _bmi = weight / pow(height / 100, 2); // 3)trocar bmi por _bmi
    return _bmi.toStringAsFixed(1); // 4)trocar bmi por _bmi
  }

  String textoResultadoBMI() {
    // if(bmi >= 25) {} 1) o bmi não pode ser acessado por essa classe, só pela resultadoBMI
    if (_bmi >= 25) {
      // 5) Agora da boa
      return 'ACIMA DO PESO';
    } else if (_bmi > 18.5) {
      return 'PESO IDEAL';
    } else {
      return 'ABAIXO DO PESO';
    }
  }

  String explicacaoResultadoBMI() {
    if (_bmi >= 25) {
      return 'Talvez seja uma boa ideia fazer um pouco mais de exercícios';
    } else if (_bmi > 18.5) {
      return 'Ótimo trabalho! Continue assim!';
    } else {
      return 'Tá precisando comer mais hein?';
    }
  }
}
