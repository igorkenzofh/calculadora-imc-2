import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   primaryColor: Color(0xff0A0E21), // muda o appbar
      //   scaffoldBackgroundColor: Color(0xff0A0E21),
      //   accentColor: Color(0xFFFFC107),
      //   textTheme: TextTheme(
      //     bodyText2: TextStyle(color: Colors.white),
      //   ),
      // ),
      theme: ThemeData.dark().copyWith(
        // aplica especificações em um tema
        primaryColor: Color(0xff0A0E21), // muda o appbar
        scaffoldBackgroundColor: Color(0xff0A0E21),
      ),
      home: InputPage(),
    );
  }
}
