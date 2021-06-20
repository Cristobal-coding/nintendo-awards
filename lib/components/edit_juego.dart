import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/pages/provider/mario_provider.dart';

import '../constants.dart';

class EditJuego extends StatefulWidget {
  final int id;
  String nombre, developer, descripcion, img, lanzamiento;
  EditJuego(
      {Key key,
      this.id,
      this.nombre,
      this.developer,
      this.descripcion,
      this.img,
      this.lanzamiento})
      : super(key: key);
  @override
  _EditJuegoState createState() => _EditJuegoState();
}

class _EditJuegoState extends State<EditJuego> {
  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController developerCtrl = new TextEditingController();
  TextEditingController descripcionCtrl = new TextEditingController();
  TextEditingController imgCtrl = new TextEditingController();
  TextEditingController lanzamientoCtrl = new TextEditingController();
  String errorNombre = '';
  String errorDeveloper = '';
  String errorDescripcion = '';
  String errorImg = '';
  String errorLanzamiento = '';
  @override
  void initState() {
    super.initState();
    nombreCtrl.text = widget.nombre;
    developerCtrl.text = widget.developer;
    descripcionCtrl.text = widget.descripcion;
    imgCtrl.text = widget.img;
    lanzamientoCtrl.text = widget.lanzamiento;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Editar Juego',
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
                  labelText: 'Nombre del juego',
                ),
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
                controller: developerCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    labelText: 'Developer',
                    hintText: 'Empresa desarrolladora'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  errorDescripcion,
                  style: TextStyle(
                      color: nintendoIconsColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Input Text First Aparicion
            // Input Text First Aparicion
            // Input Text First Aparicion
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: imgCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    labelText: 'Url Imagen(Opcional)',
                    hintText: 'Ejem: https://imgur.com/a/O9jQnN9'),
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
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: lanzamientoCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    labelText: 'Fecha de lanzamiento',
                    hintText: 'Ejem: 01-06-2016'),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  errorLanzamiento,
                  style: TextStyle(
                      color: nintendoIconsColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Input Text First Aparicion
            Container(
              child: TextField(
                maxLines: 6,
                controller: descripcionCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    labelText: 'Descripcion',
                    hintText: 'Breve descripcion del juego'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  errorDescripcion,
                  style: TextStyle(
                      color: nintendoIconsColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: nintendoPrimaryColor,
                ),
                child: Text('Editar juego'),
                onPressed: () {
                  editJuego(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void editJuego(BuildContext context) async {
    MarioProvider provider = new MarioProvider();
    var data = await provider.updateJuego(
      widget.id,
      nombreCtrl.value.text,
      developerCtrl.value.text,
      descripcionCtrl.text,
      imgCtrl.value.text,
      lanzamientoCtrl.value.text,
    );
    if (data['message'] != null) {
      setState(() {
        errorNombre =
            data['errors']['nombre'] != null ? data['errors']['nombre'][0] : '';
        errorDeveloper = data['errors']['developer'] != null
            ? data['errors']['developer'][0]
            : '';
        errorDescripcion = data['errors']['descripcion'] != null
            ? data['errors']['descripcion'][0]
            : '';
        errorImg = data['errors']['img_url'] != null
            ? data['errors']['img_url'][0]
            : '';
        errorLanzamiento = data['errors']['lanzamiento'] != null
            ? data['errors']['lanzamiento'][0]
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
                  ' Juego Actualizado correctamente.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            backgroundColor: nintendoStar,
          ),
        );
        Navigator.pop(
          context,
          nombreCtrl.value.text,
        );
      });
    }
  }
}
