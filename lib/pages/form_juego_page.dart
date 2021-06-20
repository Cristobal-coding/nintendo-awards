import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/provider/mario_provider.dart';

class FormGame extends StatefulWidget {
  FormGame({Key key}) : super(key: key);

  @override
  _FormGameState createState() => _FormGameState();
}

class _FormGameState extends State<FormGame> {
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Nuevo Juego',
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
                  labelText: 'Nombre del juego',
                ),
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
                controller: developerCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    hintStyle: TextStyle(color: nintendoIconsColor),
                    labelText: 'Developer',
                    hintText: 'Empresa desarrolladora'),
                style: TextStyle(color: nintendoPrimaryColor),
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
            Container(
              child: TextField(
                maxLines: 6,
                controller: descripcionCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    hintStyle: TextStyle(color: nintendoIconsColor),
                    labelText: 'Descripcion',
                    hintText: 'Breve descripcion del juego'),
                style: TextStyle(color: nintendoPrimaryColor),
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
            // Input Text First Aparicion
            Container(
              child: TextField(
                controller: lanzamientoCtrl,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: nintendoPrimaryColor),
                    hintStyle: TextStyle(color: nintendoIconsColor),
                    labelText: 'Fecha de lanzamiento',
                    hintText: 'Ejem: 2021-06-16'),
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


// // void createPersonaje(BuildContext context) async {
//     MarioProvider provider = new MarioProvider();
//     var data = await provider.addJuego(
//         nombreCtrl.value.text,
//         occurrenceCtrl.value.text,
//         generoCtrl.value.text,
//         creatorCtrl.value.text,
//         razaCtrl.value.text,
//         imgCtrl.value.text);
//     if (data['message'] != null) {
//       setState(() {
//         errorNombre =
//             data['errors']['nombre'] != null ? data['errors']['nombre'][0] : '';
//         errorOcurrence = data['errors']['occurrence'] != null
//             ? data['errors']['occurrence'][0]
//             : '';
//         errorGenero =
//             data['errors']['genero'] != null ? data['errors']['genero'][0] : '';
//         errorCreator = data['errors']['creator'] != null
//             ? data['errors']['creator'][0]
//             : '';
//         errorRaza =
//             data['errors']['raza'] != null ? data['errors']['raza'][0] : '';
//         errorImg = data['errors']['img_url'] != null
//             ? data['errors']['img_url'][0]
//             : '';
//       });
//     } else {
//       Navigator.pop(context);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Row(
//             children: [
//               Icon(MdiIcons.alertCircleCheckOutline, color: Colors.white),
//               Text(
//                 ' Personaje Agregado correctamente.',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ],
//           ),
//           backgroundColor: nintendoStar,
//         ),
//       );
//     }
//   }
// }