import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final icons = const [
    Icon(Icons.chat),
    Icon(Icons.search),
    Icon(Icons.add_circle),
    Icon(Icons.notifications),
    Icon(Icons.description),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.black,
      iconSize: 20,
      selectedIconTheme: const IconThemeData(
        size: 38,
      ),
      currentIndex: 2,
      items: icons
          .map(
            (icon) => BottomNavigationBarItem(
              icon: icon,
              title: Container(),
            ),
          )
          .toList(),
    );
  }
}
