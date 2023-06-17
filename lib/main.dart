import 'package:flutter/material.dart';
import './screens/home.dart';

void main() {
  runApp(BMR());
}

class BMR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
