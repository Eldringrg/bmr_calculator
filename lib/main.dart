import 'package:flutter/material.dart';

void main() {
  runApp(BMR());
}

class BMR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              'BMR Calculator',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Card(
          child: TextField(),
        ),
      ),
    );
  }
}
