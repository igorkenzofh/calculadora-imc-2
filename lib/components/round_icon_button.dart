import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(@required this.addOuSubtractIcon, @required this.action,
      {this.longPressedAction});

  IconData addOuSubtractIcon;
  Function action;
  Function longPressedAction;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 0,
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      // CTRL + click RawMat > constraint
      child: Icon(addOuSubtractIcon, size: 25, color: Colors.white),
      onPressed: action,
      onLongPress: longPressedAction,
    );
  }
}
