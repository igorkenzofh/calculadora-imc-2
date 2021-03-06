import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/button_tab.dart';
import 'package:bmi_calculator/components//round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

// Criando Enums
enum QualGenero {
  masculino,
  feminino,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  QualGenero userGenderChoice;

  // Color maleCardColor = Color(cardColor);
  // Color femaleCardColor = Color(cardColor);
  //
  // void updateCardColor(QualGenero GeneroEnum) {
  //   if (GeneroEnum == QualGenero.masculino) {
  //     if (maleCardColor == Color(cardColor)) {
  //       maleCardColor = Color(pressedCardColor);
  //       femaleCardColor = Color(cardColor);
  //     } else {
  //       maleCardColor = Color(cardColor);
  //     }
  //   } else if (GeneroEnum == QualGenero.feminino) {
  //     if (femaleCardColor == Color(cardColor)) {
  //       femaleCardColor = Color(pressedCardColor);
  //       maleCardColor = Color(cardColor);
  //     } else {
  //       femaleCardColor = Color(cardColor);
  //     }
  //   }
  // }

  int _alturaUser = 140;
  int _pesoUser = 50;
  int _idadeUser = 35;

  void _reset() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => InputPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              iconSize: 35,
              onPressed: () {
                _reset();
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  // Genero
                  child: GestureDetector(
                    // N usar flatbutton pq altera design
                    onTap: () {
                      setState(() {
                        userGenderChoice = QualGenero.masculino;
                      });
                    },
                    child: ReusableCard(
                      // maleCardColor,
                      userGenderChoice == QualGenero.masculino
                          ? Color(kPressedCardColor)
                          : Color(kCardColor),
                      cardChild: GenderContent(
                        icone: FontAwesomeIcons.mars,
                        genero: 'Masculino',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        userGenderChoice = QualGenero.feminino;
                      });
                    },
                    child: ReusableCard(
                      userGenderChoice == QualGenero.feminino
                          ? Color(kPressedCardColor)
                          : Color(kCardColor),
                      cardChild: GenderContent(
                        icone: FontAwesomeIcons.venus,
                        genero: 'Feminino',
                      ),
                    ),
                  ),
                ),
              ],
            ), // GENERO
            Row(
              children: [
                Expanded(
                  // Altura
                  child: ReusableCard(
                    _alturaUser != 140
                        ? Color(kPressedCardColor)
                        : Color(kCardColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Altura',
                          style: kCardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              _alturaUser.toString(),
                              style: kTextoGrande,
                            ),
                            Text(
                              'cm',
                              style: kCardTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          // Para aumentar a bolinha
                          // Para mudar apenas algumas config sem precisa mudar tudo
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15,
                            ),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                          ),
                          child: Slider(
                            value: _alturaUser.toDouble(),
                            min: 130,
                            max: 240,
                            divisions: 110,
                            activeColor: Color(kBottomContainerColor),
                            inactiveColor: Color(0xff8d8e98),
                            label: _alturaUser.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _alturaUser = value.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ), // ALTURA
            Row(
              children: [
                Expanded(
                  // Peso
                  child: ReusableCard(
                    _pesoUser != 50
                        ? Color(kPressedCardColor)
                        : Color(kCardColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Peso',
                          style: kCardTextStyle,
                        ),
                        Text(
                          _pesoUser.toString(),
                          style: kTextoGrande,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              () {
                                setState(() {
                                  _pesoUser > 0 ? _pesoUser-- : _pesoUser = 0;
                                });
                              },
                              longPressedAction: () {
                                if (_pesoUser > 0) {
                                  _pesoUser -= 5;
                                }
                              },
                            ),
                            SizedBox(width: 15),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                _pesoUser++;
                              });
                            }, longPressedAction: () {
                              _pesoUser += 5;
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ), // PESO
                Expanded(
                  child: ReusableCard(
                    _idadeUser != 35
                        ? Color(kPressedCardColor)
                        : Color(kCardColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Idade', style: kCardTextStyle),
                        Text(_idadeUser.toString(), style: kTextoGrande),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              () {
                                setState(() {
                                  _idadeUser > 0
                                      ? _idadeUser--
                                      : _idadeUser = 0;
                                });
                              },
                            ),
                            SizedBox(width: 15),
                            RoundIconButton(
                              FontAwesomeIcons.plus,
                              () {
                                setState(() {
                                  _idadeUser++;
                                });
                              },
                              longPressedAction: () {
                                _idadeUser += 10;
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ), // IDADE
              ],
            ), // PESO E IDADE
            BottomTabButton(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: _alturaUser, weight: _pesoUser);
                // calc.resultadoBMI(); isso não é feito nessa tela, ams na prox

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResultado: calc.resultadoBMI(),
                      bmiTextoresultado: calc.textoResultadoBMI(),
                      bmiExplicacaoresultado: calc.explicacaoResultadoBMI(),
                    ),
                  ),
                );
              },
              buttonTitle: 'CALCULAR',
            ),
          ],
        ),
      ),
    );
  }
}
