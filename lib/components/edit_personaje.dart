import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/components/show_personaje.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/provider/mario_provider.dart';

class EditPersonaje extends StatefulWidget {
  final String nombre, occurrence, generp, creator, raza, img;
  EditPersonaje(
      {Key key,
      this.nombre,
      this.occurrence,
      this.generp,
      this.creator,
      this.raza,
      this.img})
      : super(key: key);
  @override
  _EditPersonajeState createState() => _EditPersonajeState();
}

class _EditPersonajeState extends State<EditPersonaje> {
  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController occurrenceCtrl = new TextEditingController();
  TextEditingController generoCtrl = new TextEditingController();
  TextEditingController creatorCtrl = new TextEditingController();
  TextEditingController razaCtrl = new TextEditingController();
  TextEditingController imgCtrl = new TextEditingController();

  String errorNombre = '';
  String errorOcurrence = '';
  String errorGenero = '';
  String errorCreator = '';
  String errorRaza = '';
  String errorImg = '';
  @override
  void initState() {
    super.initState();
    nombreCtrl.text = widget.nombre;
    occurrenceCtrl.text = widget.occurrence;
    generoCtrl.text = widget.generp;
    creatorCtrl.text = widget.creator;
    razaCtrl.text = widget.raza;
    imgCtrl.text = widget.img;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Nuevo Personaje',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // Input Text Nombre
            Container(
              child: TextField(
                controller: nombreCtrl,
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
              child: Center(
                child: Text(
                  errorNombre,
                  style: TextStyle(
                      color: nintendoIconsColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Input Text Nombre
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: occurrenceCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    hintStyle: TextStyle(color: nintendoIconsColor),
                    labelText: 'Primera Aparición(Fecha)',
                    hintText: 'Ejem: 23-09-2021'),
                style: TextStyle(color: nintendoPrimaryColor),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  errorOcurrence,
                  style: TextStyle(
                      color: nintendoIconsColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Input Text First Aparicion
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: generoCtrl,
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
              child: Center(
                child: Text(
                  errorGenero,
                  style: TextStyle(
                      color: nintendoIconsColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Input Text First Aparicion
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: creatorCtrl,
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
              child: Center(
                child: Text(
                  errorCreator,
                  style: TextStyle(
                      color: nintendoIconsColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Input Text First Aparicion
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: razaCtrl,
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
              child: Center(
                child: Text(
                  errorRaza,
                  style: TextStyle(
                      color: nintendoIconsColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Input Text First Aparicion
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: imgCtrl,
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
              child: Center(
                child: Text(
                  errorImg,
                  style: TextStyle(
                      color: nintendoIconsColor, fontWeight: FontWeight.bold),
                ),
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
                child: Text('Actualizar personaje'),
                onPressed: () => editPersonaje(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void editPersonaje(BuildContext context) async {
    MarioProvider provider = new MarioProvider();
    var data = await provider.updatePersonaje(
        widget.nombre,
        nombreCtrl.value.text,
        occurrenceCtrl.value.text,
        generoCtrl.value.text,
        creatorCtrl.value.text,
        razaCtrl.value.text,
        imgCtrl.value.text);
    if (data['message'] != null) {
      setState(() {
        errorNombre =
            data['errors']['nombre'] != null ? data['errors']['nombre'][0] : '';
        errorOcurrence = data['errors']['occurrence'] != null
            ? data['errors']['occurrence'][0]
            : '';
        errorGenero =
            data['errors']['genero'] != null ? data['errors']['genero'][0] : '';
        errorCreator = data['errors']['creator'] != null
            ? data['errors']['creator'][0]
            : '';
        errorRaza =
            data['errors']['raza'] != null ? data['errors']['raza'][0] : '';
        errorImg = data['errors']['img_url'] != null
            ? data['errors']['img_url'][0]
            : '';
      });
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(MdiIcons.alertCircleCheckOutline, color: Colors.white),
                Text(
                  ' Personaje Actualizado correctamente.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            backgroundColor: nintendoStar,
          ),
        );
        Navigator.pop(context, nombreCtrl.value.text,);
      });
    }
  }
}
