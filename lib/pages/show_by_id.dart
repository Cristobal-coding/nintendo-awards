import 'package:flutter/material.dart';
import 'package:nintendo_awards/components/show_personaje.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/provider/mario_provider.dart';

class ShowById extends StatefulWidget {
  final String nombre, set;
  ShowById({Key key, this.nombre, this.set}) : super(key: key);

  @override
  _ShowByIdState createState() => _ShowByIdState();
}

class _ShowByIdState extends State<ShowById> {
  @override
  Widget build(BuildContext context) {
    MarioProvider mario = new MarioProvider();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: nintendoPrimaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      nintendoIconsColor,
                      nintendoPrimaryColor,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: nintendoIconsColor,
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 1.0),
                    )
                  ],
                ),
                child: Column(children: [
                  ShowPersonaje(
                    nombre: widget.nombre,
                  ),
                ])),
          ),
        ),
      ),
    );
  }
}
