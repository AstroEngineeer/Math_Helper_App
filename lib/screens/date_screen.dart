import 'package:Mixed/widgets/CustomGridView.dart';
import 'package:Mixed/widgets/LabeledDatePicker.dart';
import 'package:flutter/material.dart';

class DateScreen extends StatefulWidget {
  @override
  _DateScreenState createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  TextEditingController dateController1 = TextEditingController();
  TextEditingController dateController2 = TextEditingController();
  var diff = [
    {"label": "year", "value": 0},
    {"label": "mon", "value": 0},
    {"label": "days", "value": 0},
    {"label": "hours", "value": 0},
    {"label": "min", "value": 0},
    {"label": "sec", "value": 0},
  ];

  void findDiff() {
    DateTime date1 = DateTime.parse(dateController1.text);
    DateTime date2 = DateTime.parse(dateController2.text);
    setState(() {
      diff = [
        {
          "label": "year",
          "value": date1.difference(date2).inSeconds / 31536000
        },
        {
          "label": "mon",
          "value": date1.difference(date2).inSeconds / 2628002.88
        },
        {"label": "days", "value": date1.difference(date2).inDays},
        {"label": "hours", "value": date1.difference(date2).inHours},
        {"label": "min", "value": date1.difference(date2).inMinutes},
        {"label": "sec", "value": date1.difference(date2).inSeconds},
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
        FlatButton(onPressed: findDiff, child: Text("Find Diff")),
        CustomGridView(diff),
      ],
    );
  }
}
