import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomTabButton extends StatelessWidget {
  BottomTabButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: Color(kBottomContainerColor),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
