import 'package:Mixed/widgets/CustomGridView.dart';
import 'package:Mixed/widgets/CustomDatePicker.dart';
import 'package:flutter/material.dart';

class DateScreen extends StatefulWidget {
  @override
  _DateScreenState createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  TextEditingController dateController1 = TextEditingController();
  TextEditingController dateController2 = TextEditingController();
  var diff = [
    {"label": "Years", "value": 0},
    {"label": "Months", "value": 0},
    {"label": "Days", "value": 0},
    {"label": "Hours", "value": 0},
    {"label": "Minutes", "value": 0},
    {"label": "Seconds", "value": 0},
  ];

  void findDiff() {
    DateTime date1 = DateTime.parse(dateController1.text);
    DateTime date2 = DateTime.parse(dateController2.text);
    setState(() {
      diff = [
        {
          "label": "Years",
          "value": date1.difference(date2).inSeconds / 31536000
        },
        {
          "label": "Months",
          "value": date1.difference(date2).inSeconds / 2628002.88
        },
        {"label": "Days", "value": date1.difference(date2).inDays},
        {"label": "Hours", "value": date1.difference(date2).inHours},
        {"label": "Minutes", "value": date1.difference(date2).inMinutes},
        {"label": "Seconds", "value": date1.difference(date2).inSeconds},
      ];
      print(diff);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledDatePicker(
          dateController: dateController1,
          label: "Date1",
        ),
        LabeledDatePicker(
          dateController: dateController2,
          label: "Date2",
        ),
        RaisedButton(onPressed: findDiff, child: Text("Find Differnece")),
        CustomGridView(diff),
      ],
    );
  }
}
