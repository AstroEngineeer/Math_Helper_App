import 'dart:math';

import 'package:Mixed/widgets/CustomGridView.dart';
import "package:flutter/material.dart";

class MathScreen extends StatefulWidget {
  @override
  _MathScreenState createState() => _MathScreenState();
}

class _MathScreenState extends State<MathScreen> {
  TextEditingController numController = TextEditingController();
  List x = [];

  void add() {
    x.add(int.parse(numController.text));
    numController.text = "";
    setState(() {});
  }

  void remove() {
    x.remove(int.parse(numController.text));
    numController.text = "";
    setState(() {});
  }

  int gcd(int a, int b) {
    if (b == 0) return a;
    return gcd(b, a % b);
  }

  int findGcd() {
    int result = x[0];
    for (int i = 1; i < x.length; i++) {
      result = gcd(result, x[i]);
    }
    return result;
  }

  int findlcm() {
    int ans = x[0];
    for (int i = 1; i < x.length; i++) {
      ans = ((x[i] * ans) / gcd(x[i], ans)).toInt();
    }
    return ans;
  }

  double findVariance() {
    var sum = 0;
    for (var i in x) {
      sum += i;
    }
    double avg = sum / x.length;
    double sum1 = 0;
    for (var i in x) {
      sum1 += (i.toDouble() - avg) * (i.toDouble() - avg);
    }
    var ans = sum1 / x.length;
    return ans;
  }

  double findSd() {
    return sqrt(findVariance());
  }

  var cal = [
    {"label": "GCD", "value": 0},
    {"label": "LCM", "value": 0},
    {"label": "Variance", "value": 0},
    {"label": "SD", "value": 0},
  ];
  void calculate() {
    cal = [
      {"label": "GCD", "value": findGcd()},
      {"label": "LCM", "value": findlcm()},
      {"label": "Variance", "value": findVariance()},
      {"label": "SD", "value": findSd()},
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      labelText: "List",
                      labelStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  controller: numController,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: add,
              child: Text("Add"),
            ),
            RaisedButton(
              onPressed: remove,
              child: Text("Remove"),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            x.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(
          color: Colors.black,
          height: 40,
          thickness: 2,
        ),
        RaisedButton(
          onPressed: calculate,
          child: Text("Calculate"),
        ),
        CustomGridView(cal),
      ],
    );
  }
}
