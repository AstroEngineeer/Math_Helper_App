import 'package:flutter/material.dart';

class MatrixScreen extends StatefulWidget {
  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  TextEditingController rcController = TextEditingController();
  TextEditingController numController = TextEditingController();

  bool create = false;
  List<List> matrix;
  int row = 0, column = 0;
  void createMatrix() {
    matrix = [];
    row = 0;
    column = 0;
    int n = int.parse(rcController.text);
    if (n > 47) {
      n = 47;
      rcController.text = "47";
    }
    for (int i = 0; i < n; i++) {
      List temp = [];
      for (int i = 0; i < n; i++) temp.add("0");
      matrix.add(temp);
    }
    setState(() {
      create = true;
    });
  }

  List<List> result;
  void createResult() {
    result = [];
    int n = int.parse(rcController.text);
    if (n > 47) {
      n = 47;
      rcController.text = "47";
    }
    for (int i = 0; i < n; i++) {
      List temp = [];
      for (int i = 0; i < n; i++) temp.add("0");
      result.add(temp);
    }
  }

  void transpose() {
    createResult();
    var n = int.parse(rcController.text);
    for (int i = 0; i < n; ++i)
      for (int j = 0; j < n; ++j) {
        result[j][i] = matrix[i][j];
      }
    dialog("Transpose");
  }

  void bl() {
    createResult();
    var n = int.parse(rcController.text);
    for (int i = 0; i < n; ++i)
      for (int j = 0; j < i + 1; ++j) {
        result[i][j] = matrix[i][j];
      }
    dialog("Bottom-Left");
  }

  void tr() {
    createResult();
    var n = int.parse(rcController.text);
    for (int i = 0; i < n; i++)
      for (int j = n - 1; j >= i; j--) {
        result[i][j] = matrix[i][j];
      }
    dialog("Top-Right");
  }

  void tl() {
    createResult();
    var n = int.parse(rcController.text);
    for (int i = 0; i < n; i++)
      for (int j = 0; j < n - i; j++) {
        result[i][j] = matrix[i][j];
      }
    dialog("Top-Left");
  }

  void br() {
    createResult();
    var n = int.parse(rcController.text);
    for (int i = 0; i < n; i++)
      for (int j = n - 1; j >= n - i - 1; j--) {
        result[i][j] = matrix[i][j];
      }
    dialog("Bottom-Right");
  }

  void dialog(x) {
    showDialog(
      context: context,
      child: SimpleDialog(title: Text("$x"), children: [
        SizedBox(
          height: 20 * double.parse(rcController.text),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: result
                  .map((e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: e
                            .map((e) => Text(
                                  e,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ))
                            .toList(),
                      ))
                  .toList()),
        ),
      ]),
    );
  }

  void add() {
    var value = int.parse(numController.text);
    var n = int.parse(rcController.text);
    if (row < n) {
      if (column < n) {
        matrix[row][column] = value.toString();
        column++;
      } else {
        row++;
        column = 0;
        matrix[row][column] = value.toString();
        column++;
      }
    } else {}
    setState(() {
      numController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: TextField(
                decoration: InputDecoration(labelText: "Rows & Columns"),
                keyboardType: TextInputType.number,
                controller: rcController,
              ),
            ),
            RaisedButton(
              onPressed: createMatrix,
              child: Text("Create"),
              color: Colors.teal,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: TextField(
                decoration: InputDecoration(labelText: "Value"),
                keyboardType: TextInputType.number,
                controller: numController,
              ),
            ),
            RaisedButton(
              onPressed: add,
              child: Text("Add"),
              color: Colors.teal,
            ),
            IconButton(
              onPressed: transpose,
              icon: Icon(Icons.swap_horiz),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                onPressed: tl,
                child: Text("Topleft"),
                color: Colors.teal,
              ),
              RaisedButton(
                onPressed: tr,
                child: Text("Topright"),
                color: Colors.teal,
              ),
              RaisedButton(
                onPressed: bl,
                child: Text("Bottomleft"),
                color: Colors.teal,
              ),
              RaisedButton(
                onPressed: br,
                child: Text("Bottomright"),
                color: Colors.teal,
              ),
            ],
          ),
        ),
        create
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 20 * double.parse(rcController.text),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: matrix
                          .map((e) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: e
                                    .map((e) => Text(
                                          e,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ))
                                    .toList(),
                              ))
                          .toList()),
                ),
              )
            : Text(""),
      ],
    );
  }
}
