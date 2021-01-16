import 'package:Mixed/screens/dates_screen.dart';
import 'package:Mixed/screens/currency_screen.dart';
import 'package:Mixed/screens/sets_screen.dart';
import 'package:flutter/material.dart';

import 'math_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var screens = [
    {"title": "Differnece between dates", "screen": DateScreen()},
    {"title": "Set", "screen": SetsScreen()},
    {"title": "Matrix", "screen": DateScreen()},
    {"title": "Textify", "screen": CurrencyScreen()},
    {"title": "Math", "screen": MathScreen()},
  ];

  var apps = [
    {"label": "Dates", "icon": Icons.ac_unit},
    {"label": "Sets", "icon": Icons.ac_unit},
    {"label": "Matrix", "icon": Icons.ac_unit},
    {"label": "Textify", "icon": Icons.ac_unit},
    {"label": "Math", "icon": Icons.ac_unit}
  ];

  int selectedIndex = 0;
  void selectIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screens[selectedIndex]["title"]),
      ),
      body: screens[selectedIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: selectIndex,
        type: BottomNavigationBarType.fixed,
        items: apps
            .map(
              (e) => BottomNavigationBarItem(
                  icon: Icon(e["icon"]), label: e["label"]),
            )
            .toList(),
      ),
    );
  }
}
