import 'package:flutter/material.dart';

void main() {
  runApp(BMR());
}

class BMR extends StatefulWidget {
  @override
  State<BMR> createState() => _BMRState();
}

class _BMRState extends State<BMR> {
  TextEditingController Age = TextEditingController();

  TextEditingController Weight = TextEditingController();

  TextEditingController Height = TextEditingController();

  int _val;
  int age = 0;
  int height = 0;
  int weight = 0;

  double result;
  basalmetabolismrate() {
    setState(
      () {
        age = int.parse(Age.text);
        weight = int.parse(Height.text);
        height = int.parse(Weight.text);

        result =
            (88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: const Text(
              'BMR CALCULATOR',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 2, 37, 102),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 50,
              left: 10,
              right: 10,
            ),
            child: Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: const Text(
                            'Age',
                            textScaleFactor: 2,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: Age,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: const Text(
                            'ages 15-80',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: const Text(
                            'Gender',
                            textScaleFactor: 2,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Radio(
                            value: 1,
                            groupValue: _val,
                            onChanged: (value) {
                              value = _val;
                            },
                          ),
                        ),
                        const Text(
                          'Male',
                        ),
                        Radio(
                          value: 2,
                          groupValue: _val,
                          onChanged: (value) {
                            value = _val;
                          },
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: const Text(
                            'Female',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: const Text(
                            'Height',
                            textScaleFactor: 2,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: Height,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'in cm',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(20),
                          child: const Text(
                            'Weight',
                            textScaleFactor: 2,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: Weight,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'in kg',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    RaisedButton(
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        basalmetabolismrate();
                        Age.clear();
                        Weight.clear();
                        Height.clear();
                      },
                      color: Colors.green,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Result:$result' + 'Calories/day',
                        style: TextStyle(),
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
