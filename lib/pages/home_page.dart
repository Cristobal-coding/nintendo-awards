import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/icons_bottom_nav_icons.dart';
import 'package:nintendo_awards/pages/mario_page.dart';
import 'package:nintendo_awards/pages/zelda_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  var _pages = [
    {
      'page': MarioPage(),
      'texto': 'Mario Bros',
      'color': nintendoPrimaryColor,
      'font': nintendoFontFamily,
    },
    {
      'page': ZeldaPage(),
      'texto': 'The legend of Zelda',
      'color': zeldaBackground,
      'font': zeldaFontFamily,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            _pages[_currentIndex]['texto'],
            style: TextStyle(fontFamily: _pages[_currentIndex]['font']),
          ),
          backgroundColor: (_pages[_currentIndex]['color'])),
      body: _pages[_currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle:
            TextStyle(fontFamily: _pages[_currentIndex]['font']),
        unselectedFontSize: 0,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(IconsBottomNav.hongo),
              label: 'Mario',
              backgroundColor: (_pages[_currentIndex]['color'])),
          BottomNavigationBarItem(
              icon: Icon(IconsBottomNav.triforce),
              label: 'The legend of Zelda',
              backgroundColor: (_pages[_currentIndex]['color'])),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
