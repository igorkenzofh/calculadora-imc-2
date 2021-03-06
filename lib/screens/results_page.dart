import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/button_tab.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'input_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  // void textoResultadoCalc(resultadoCalc) {
  //   if(resultadoCalc > 25){
  //     textoResultadoCalc() =
  //   }
  // }

  // É preciso passar algumas propriedades para poder acessar nessa nova pg

  ResultsPage(
      // Isso vai permitir passar as propr para a input_page
      {@required this.bmiResultado,
      @required this.bmiTextoresultado,
      @required this.bmiExplicacaoresultado});

  final String bmiResultado;
  final String bmiTextoresultado;
  final String bmiExplicacaoresultado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // NÃO PRECISA DISSO, FAZ AUTOMATICO POR TER SÓ DUAS TELAS
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.arrow_back_outlined),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ],
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ISSO AQUI FAZ O CARD OCUPAR A WIDTH INTEIRA
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'Seu resultado:',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              // O CONTAINER
              child: ReusableCard(
                Color(kCardColor),
                cardChild: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      bmiTextoresultado
                          .toUpperCase(), // possível pq na input_page passamos esse metodo
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff24d876)),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Text(
                      bmiResultado, // possível pq na input_page passamos esse metodo
                      style:
                          TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 120),
                    Text(
                      bmiExplicacaoresultado, // possível pq na input_page passamos esse metodo
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomTabButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RECALCULAR',
          ),
        ],
      ),
    );
  }
}
