import 'package:flutter/material.dart';
import 'package:nintendo_awards/pages/mario_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba"),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBar.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Mario',
          ),
          BottomNavigationBarItem(
            label: 'The legend of Zelda',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
