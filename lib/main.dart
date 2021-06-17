import 'package:flutter/material.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nintendo Awards°',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: nintendoPrimaryColor, fontFamily: nintendoFontFamily),
      home: HomePage(),
    );
  }
}
