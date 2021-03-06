import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class GenderContent extends StatelessWidget {
  GenderContent({this.icone, this.genero});

  final IconData icone;
  final String genero;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icone,
          size: 70,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          genero,
          style: kCardTextStyle,
        )
      ],
    );
  }
}
