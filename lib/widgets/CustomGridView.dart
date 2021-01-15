import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomGridView extends StatelessWidget {
  List<Map<String, Object>> map;
  CustomGridView(this.map);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 15,
        ),
        children:
            map.map((e) => buildContainer(e["label"], e["value"])).toList(),
      ),
    );
  }

  Container buildContainer(label, value) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "$label",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: value is String
                  ? Text(
                      value,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  : Text(
                      value.abs().toStringAsFixed(4),
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(colors: [
          Colors.tealAccent.withOpacity(0.8),
          Colors.deepPurple.withOpacity(0.7),
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
      ),
    );
  }
}
