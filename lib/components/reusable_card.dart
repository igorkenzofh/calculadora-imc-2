import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(this.collor, {this.cardChild}); // constructor

  final Color collor; // properties
  final Widget cardChild; // criando um widget customizado

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      height: 200,
      width: 170,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: collor,
      ),
    );
  }
}
