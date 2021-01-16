import 'package:flutter/material.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  TextEditingController numController = TextEditingController();
  // ignore: non_constant_identifier_names
  String textfied_num = "";

  // ignore: missing_return
  String tens(x, y) {
    if (x == "1") {
      switch (y) {
        case "0":
          return "ten";
          break;
        case "1":
          return "eleven";
          break;
        case "2":
          return "twelve";
          break;
        case "3":
          return "thirteen";
          break;
        case "4":
          return "fourteen";
          break;
        case "5":
          return "fifteen";
          break;
        case "6":
          return "sixteen";
          break;
        case "7":
          return "seventeen";
          break;
        case "8":
          return "eighteen";
          break;
        case "9":
          return "nineteen";
          break;
      }
    } else {
      String text = "";
      switch (x) {
        case "0":
          text += "";
          break;
        case "2":
          text += "twenty";
          break;
        case "3":
          text += "thirty";
          break;
        case "4":
          text += "fourty";
          break;
        case "5":
          text += "fifty";
          break;
        case "6":
          text += "sixty";
          break;
        case "7":
          text += "seventy";
          break;
        case "8":
          text += "eighty";
          break;
        case "9":
          text += "ninety";
          break;
      }
      switch (y) {
        case "0":
          text += "";
          break;
        case "1":
          text += " one";
          break;
        case "2":
          text += " two";
          break;
        case "3":
          text += " three";
          break;
        case "4":
          text += " four";
          break;
        case "5":
          text += " five";
          break;
        case "6":
          text += " six";
          break;
        case "7":
          text += " seven";
          break;
        case "8":
          text += " eight";
          break;
        case "9":
          text += " nine";
          break;
      }
      return text;
    }
  }

  String textify() {
    String text = "";
    var list = numController.text.split(".");
    var x = list[0].split("").reversed.toList();
    if (x.length > 3 && x.length.isEven) x.add("0");
    try {
      if (int.parse(list[1]) > 99) {
        list[1] = "99";
        numController.text = list[0].toString() + ".99";
      }
      var y = list[1].split("");
      if (y.length == 1) text = " DOT " + tens(y[0], "0") + " paisa";
      if (y.length == 2) text = " DOT " + tens(y[0], y[1]) + " paisa";
    } catch (exception) {}

    if (x.length == 1) text = tens("0", x[0]) + " rupees" + text;
    if (x.length == 2) text = tens(x[1], x[0]) + " rupees" + text;
    if (x.length == 3)
      text =
          tens("0", x[2]) + " hundred " + tens(x[1], x[0]) + " rupees" + text;
    if (x.length > 3)
      text =
          tens("0", x[2]) + " hundred " + tens(x[1], x[0]) + " rupees" + text;
    for (int i = 3; i < x.length; i += 2) {
      if (i == 3) text = "thousand " + text;
      if (i == 5) text = "lakh " + text;
      if (i == 7) text = "crore " + text;
      if (i == 9) text = "arab " + text;
      if (i == 11) text = "kharab " + text;
      if (i == 13) text = "nil " + text;
      if (i == 15) text = "padma " + text;
      text = tens(x[i + 1], x[i]) + " " + text;
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                labelText: "Amount",
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            controller: numController,
            maxLength: 20,
          ),
        ),
        RaisedButton(
          onPressed: () {
            textfied_num = textify();
            setState(() {});
          },
          child: Text("Textify"),
          color: Colors.teal,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            textfied_num,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
