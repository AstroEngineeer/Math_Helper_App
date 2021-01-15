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
        Text(label),
        SizedBox(
          width: 200,
          child: TextField(
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
        )
      ],
    );
  }
}
