import 'package:flutter/material.dart';

class SetsScreen extends StatefulWidget {
  @override
  _SetsScreenState createState() => _SetsScreenState();
}

class _SetsScreenState extends State<SetsScreen> {
  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();

  var setA = <String>{};
  void addA() {
    if (setA.isEmpty) setA = <String>{aController.text};
    setA.add(aController.text);
    aController.text = "";
    setState(() {});
  }

  void removeA() {
    if (setA.isEmpty)
      setA = <String>{};
    else {
      if (aController.text.isNotEmpty) setA.remove(aController.text);
    }
    setState(() {});
  }

  var setB = <String>{};
  void addB() {
    if (setB.isEmpty) setB = <String>{bController.text};
    setB.add(bController.text);
    bController.text = "";
    setState(() {});
  }

  void removeB() {
    if (setB.isEmpty)
      setB = <String>{};
    else {
      if (bController.text.isNotEmpty) setB.remove(bController.text);
    }
    setState(() {});
  }

  void swap() {
    var temp = setA;
    setA = setB;
    setB = temp;
    setState(() {});
  }

  var finalSet = <String>{};
  void union() {
    finalSet = setA.union(setB);
    setState(() {});
  }

  void minus() {
    finalSet = <String>{};
    finalSet = setA.difference(setB);
    setState(() {});
  }

  void intersection() {
    finalSet = <String>{};
    finalSet = setA.intersection(setB);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SetIO(
            context: context,
            label: "Set A",
            add: addA,
            remove: removeA,
            controller: aController,
            sett: setA),
        IconButton(
          icon: Icon(Icons.swap_horiz),
          onPressed: swap,
          iconSize: 40,
        ),
        SetIO(
            context: context,
            label: "Set B",
            add: addB,
            remove: removeB,
            controller: bController,
            sett: setB),
        Divider(
          color: Colors.black,
          height: 20,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: union,
              child: Text("Union"),
              color: Colors.teal,
            ),
            RaisedButton(
              onPressed: minus,
              child: Text("Minus"),
              color: Colors.teal,
            ),
            RaisedButton(
              onPressed: intersection,
              child: Text("Intersection"),
              color: Colors.teal,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            finalSet.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class SetIO extends StatelessWidget {
  SetIO({
    Key key,
    @required this.context,
    @required this.label,
    @required this.add,
    @required this.remove,
    @required this.controller,
    @required this.sett,
  }) : super(key: key);

  final BuildContext context;
  var label;
  var add;
  var remove;
  var controller;
  var sett;

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
                      labelText: label,
                      labelStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  controller: controller,
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
              color: Colors.teal,
            ),
            RaisedButton(
              onPressed: remove,
              child: Text("Remove"),
              color: Colors.teal,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            sett.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
