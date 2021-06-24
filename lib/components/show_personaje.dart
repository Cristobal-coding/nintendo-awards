import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/components/edit_personaje.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/provider/mario_provider.dart';
import 'package:nintendo_awards/pages/widgets/hongo_progress_indicator.dart';

class ShowPersonaje extends StatefulWidget {
  final String nombre;
  ShowPersonaje({Key key, this.nombre}) : super(key: key);

  @override
  _ShowPersonajeState createState() => _ShowPersonajeState();
}

class _ShowPersonajeState extends State<ShowPersonaje> {
  @override
  void initState() {
    super.initState();
    nombreID = widget.nombre;
  }

  String nombreID;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MarioProvider mario = new MarioProvider();
    return FutureBuilder(
      future: mario.getOneById('personajes', nombreID),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
              padding: EdgeInsets.only(top: 150),
              child: HongoProgressIndicator(
                font: 50,
              ));
        } else {
          return Container(
            height: size.height * 0.5,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        snapshot.data['img_url'] != null
                            ? snapshot.data['img_url']
                            : 'https://i.imgur.com/GnkzOs4.png',
                        width: 50,
                        height: 70,
                      ),
                      Container(
                        height: size.height * 0.1,
                        width: size.width * 0.65,
                        child: FittedBox(
                          child: Text(
                            snapshot.data['nombre'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Raza: ',
                        style: TextStyle(color: nintendoStar, fontSize: 20),
                      ),
                      Text(
                        '${snapshot.data['raza']}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        'Género: ',
                        style: TextStyle(color: nintendoStar, fontSize: 20),
                      ),
                      Text(
                        '${snapshot.data['genero']}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          'Primera Aparicion en: ',
                          style: TextStyle(color: nintendoStar, fontSize: 20),
                        ),
                        Text(
                          '${snapshot.data['occurrence']}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    height: size.height * 0.2692,
                    // width: 200,

                    child: Column(
                      children: [
                        Text('Creador:',
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                        Text(
                          '${snapshot.data['creator']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                            // color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0, vertical: 0),
                                  child: Container(
                                    width: 140,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: nintendoPrimaryColor),
                                      onPressed: () {
                                        goUpdatePersonaje(
                                            context,
                                            snapshot.data['nombre'],
                                            snapshot.data['occurrence'],
                                            snapshot.data['genero'],
                                            snapshot.data['creator'],
                                            snapshot.data['raza'],
                                            snapshot.data['img_url']);
                                      },
                                      child: Text('Editar'),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: nintendoPrimaryColor),
                                    child: Text('Eliminar'),
                                    onPressed: () {
                                      confirmDialog(
                                              context, snapshot.data['nombre'])
                                          .then((value) {
                                        if (value) {
                                          Navigator.pop(context);
                                          showMessageSuccess(
                                              'El Personaje ${snapshot.data["nombre"]} ha sido Borrado.');
                                          setState(() {
                                            mario.deletePersonaje(
                                                snapshot.data['nombre']);
                                          });
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          );
        }
      },
    );
  }

  void showMessageSuccess(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(MdiIcons.alertCircleCheckOutline, color: Colors.white),
            Text(
              ' ' + mensaje,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: nintendoStar,
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context, String nombre) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmación de Eliminación'),
            content: Text('¿Desea borrar el Personaje $nombre?'),
            actions: [
              TextButton(
                style: TextButton.styleFrom(primary: nintendoPrimaryColor),
                child: Text('CANCELAR'),
                // onPressed: () => print('Cancelado'),
                onPressed: () => Navigator.pop(context, false),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: nintendoPrimaryColor),
                child: Text('ACEPTAR'),
                // onPressed: () => print('Aceptado'),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          );
        });
  }

  void goUpdatePersonaje(BuildContext context, String nombre, occurrence,
      genero, creator, raza, img_url) {
    final route = new MaterialPageRoute(
        builder: (context) => EditPersonaje(
              nombre: nombre,
              occurrence: occurrence,
              generp: genero,
              creator: creator,
              raza: raza,
              img: img_url,
            ));
    Navigator.push(context, route).then((value) {
      setState(() {
        print(value);
        if (value != null) {
          nombreID = value;
        }
      });
    });
  }
}
