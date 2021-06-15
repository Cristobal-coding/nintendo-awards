import 'package:flutter/material.dart';
import 'package:nintendo_awards/constants.dart';

class ZeldaPage extends StatelessWidget {
  const ZeldaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width,
            height: size.height * 0.7,
            child: ListView(),
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
