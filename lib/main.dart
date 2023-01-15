import 'package:flutter/material.dart';

void main() {
  runApp(BMR());
}

class BMR extends StatelessWidget {
  int _val;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              'BMR Calculator',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 2, 37, 102),
        ),
        body: SingleChildScrollView(
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
                          child: Text(
                            'Age',
                            textScaleFactor: 2,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'ages 15-80',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
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
                        Text(
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
                          child: Text(
                            'Female',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Height',
                            textScaleFactor: 2,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Weight',
                            textScaleFactor: 2,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
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
                      onPressed: () {},
                      color: Colors.green,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
