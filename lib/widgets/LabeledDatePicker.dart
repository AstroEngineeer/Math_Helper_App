import 'package:flutter/material.dart';

class LabeledDatePicker extends StatelessWidget {
  const LabeledDatePicker({
    Key key,
    @required this.dateController,
    @required this.label,
  }) : super(key: key);

  final TextEditingController dateController;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: "Enter Date",
                  labelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              controller: dateController,
              readOnly: true,
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                dateController.text = date.toString().substring(0, 10);
              },
            ),
          ),
        )
      ],
    );
  }
}
