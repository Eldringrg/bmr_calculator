import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _BMRState();
}

class _BMRState extends State<Home> {
  final formKey = GlobalKey<FormState>();
  TextEditingController Age = TextEditingController();

  TextEditingController Weight = TextEditingController();

  TextEditingController Height = TextEditingController();
  void dispose() {
    Age.dispose();
    Weight.dispose();
    Height.dispose();
    super.dispose();
  }

  int _val = 0;
  double age = 0;
  double height = 0;
  double weight = 0;
  double result = 0;

  FocusNode first = FocusNode();
  FocusNode second = FocusNode();
  FocusNode third = FocusNode();

  basalmetabolismrate() {
    setState(
      () {
        age = double.parse(Age.text);
        height = double.parse(Height.text);
        weight = double.parse(Weight.text);
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
                  child: Form(
                    key: formKey,
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
                              child: TextFormField(
                                focusNode: first,
                                controller: Age,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(second);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter age";
                                  }
                                  if (double.parse(value) < 15) {
                                    return "Enter age > 14";
                                  }
                                  if (RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                                    return "Enter integer value";
                                  } else {
                                    return null;
                                  }
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
                                    _val = value as int;
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
                                  _val = value as int;
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
                                child: TextFormField(
                                    focusNode: second,
                                    controller: Height,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'in cm',
                                    ),
                                    keyboardType: TextInputType.number,
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context)
                                          .requestFocus(third);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter height";
                                      } else {
                                        return null;
                                      }
                                    }),
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
                                child: TextFormField(
                                    focusNode: third,
                                    controller: Weight,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'in kg',
                                    ),
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter weight";
                                      } else {
                                        return null;
                                      }
                                    }),
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
                                  if (formKey.currentState!.validate()) {}
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
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'BMR = $result' ' Calories/day',
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.6,
                                ),
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
      ),
    );
  }
}
