import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _BMRState();
}

class _BMRState extends State<Home> {
  TextEditingController Age = TextEditingController();

  TextEditingController Weight = TextEditingController();

  TextEditingController Height = TextEditingController();
  void dispose() {
    Age.dispose();
    Weight.dispose();
    Height.dispose();
    super.dispose();
  }

  int _val;
  int age = 0;
  int height = 0;
  int weight = 0;
  double result;

  FocusNode first = FocusNode();
  FocusNode second = FocusNode();
  FocusNode third = FocusNode();

  basalmetabolismrate() {
    setState(
      () {
        age = int.parse(Age.text);
        height = int.parse(Height.text);
        weight = int.parse(Weight.text);
        if (_val == 1) {
          result = (5 + (10 * weight) + (6.25 * height) - (5 * age));
        } else {
          result = ((10 * weight) + (6.25 * height) - (5 * age) - 161);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
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
                              child: SizedBox(
                            height: 45,
                            child: TextField(
                              focusNode: first,
                              controller: Age,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              onSubmitted: (value) {
                                FocusScope.of(context).requestFocus(second);
                              },
                            ),
                          )),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: const Text(
                              'Age:15-80',
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
                          Expanded(
                            child: Radio(
                              value: 1,
                              groupValue: _val,
                              onChanged: (value) {
                                setState(() {
                                  _val = value;
                                });
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
                              setState(() {
                                _val = value;
                              });
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
                            child: SizedBox(
                              height: 45,
                              width: 150,
                              child: TextField(
                                focusNode: second,
                                controller: Height,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'in cm',
                                ),
                                keyboardType: TextInputType.number,
                                onSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(third);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(9),
                            child: const Text(
                              'Weight',
                              textScaleFactor: 2,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              child: TextField(
                                focusNode: third,
                                controller: Weight,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'in kg',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 150.0,
                            height: 40,
                            child: RaisedButton(
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
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'BMR = $result' ' Calories/day',
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.6,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
