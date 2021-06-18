import 'package:flutter/material.dart';
import 'package:nintendo_awards/constants.dart';

class FormPersonaje extends StatefulWidget {
  FormPersonaje({Key key}) : super(key: key);

  @override
  _FormPersonajeState createState() => _FormPersonajeState();
}

class _FormPersonajeState extends State<FormPersonaje> {
  TextEditingController personajeCtrl = new TextEditingController();
  String errorNombre = '';
  String errorOcurrence = '';
  String errorGenero = '';
  String errorRaza = '';
  String errorImg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Nuevo Personaje',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Input Text Nombre
            Container(
              child: TextField(
                controller: personajeCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    hintStyle: TextStyle(color: nintendoIconsColor),
                    labelText: 'Nombre del Personaje',
                    hintText: 'Nombre único'),
                style: TextStyle(color: nintendoPrimaryColor),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errorNombre,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            // Input Text Nombre
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: personajeCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    hintStyle: TextStyle(color: nintendoIconsColor),
                    labelText: 'Primera Aparición(Fecha)',
                    hintText: 'Formato dd/mm/yyyy'),
                style: TextStyle(color: nintendoPrimaryColor),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errorOcurrence,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            // Input Text First Aparicion
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: personajeCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    hintStyle: TextStyle(color: nintendoIconsColor),
                    labelText: 'Genero',
                    hintText: 'Masculino | Femenino'),
                style: TextStyle(color: nintendoPrimaryColor),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errorGenero,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            // Input Text First Aparicion
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: personajeCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    hintStyle: TextStyle(color: nintendoIconsColor),
                    labelText: 'Creador | Diseñador',
                    hintText: 'Ejem: Eiji Aonuma'),
                style: TextStyle(color: nintendoPrimaryColor),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errorGenero,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            // Input Text First Aparicion
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: personajeCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    hintStyle: TextStyle(color: nintendoIconsColor),
                    labelText: 'Raza',
                    hintText: 'Ejem: Humana'),
                style: TextStyle(color: nintendoPrimaryColor),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errorRaza,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            // Input Text First Aparicion
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: personajeCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    hintStyle: TextStyle(color: nintendoIconsColor),
                    labelText: 'Url Imagen(Opcional)',
                    hintText: 'Ejem: https://imgur.com/a/O9jQnN9'),
                style: TextStyle(color: nintendoPrimaryColor),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errorImg,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            // Input Text First Aparicion
            Spacer(),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: nintendoPrimaryColor,
                ),
                child: Text('Agregar personaje'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
