import 'package:Mixed/screens/date_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var screens = [
    {"title": "Differnece between dates", "screen": DateScreen()},
    {"title": "Set", "screen": DateScreen()},
    {"title": "Matrix", "screen": DateScreen()},
    {"title": "Currency", "screen": DateScreen()},
    {"title": "LCM", "screen": DateScreen()},
  ];

  var apps = [
    {"label": "Date", "icon": Icons.ac_unit},
    {"label": "Set", "icon": Icons.ac_unit},
    {"label": "matrix", "icon": Icons.ac_unit},
    {"label": "Currency", "icon": Icons.ac_unit},
    {"label": "LCm", "icon": Icons.ac_unit}
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
