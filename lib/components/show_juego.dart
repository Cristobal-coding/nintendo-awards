import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/components/edit_juego.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/games_add_personajes.dart';
import 'package:nintendo_awards/pages/provider/mario_provider.dart';

class ShowJuego extends StatefulWidget {
  final int id;
  ShowJuego({Key key, this.id}) : super(key: key);

  @override
  _ShowJuegoState createState() => _ShowJuegoState();
}

class _ShowJuegoState extends State<ShowJuego> {
  @override
  void initState() {
    super.initState();
    idd = widget.id;
  }

  int idd;
  @override
  Widget build(BuildContext context) {
    MarioProvider mario = new MarioProvider();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder(
            future: mario.getJuego(idd),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Image.network(snapshot.data['img_url'],
                              width: size.width * 0.4,
                              height: size.height * 0.28),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 0),
                              child: Container(
                                  width: size.width * 0.4,
                                  child: FittedBox(
                                    child: Text(
                                      snapshot.data['nombre'],
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  )),
                            ),
                            Container(
                              width: size.width * 0.55,
                              height: size.height * 0.21,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/images/family4.png'),
                                ),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  goEditJuego(
                                      context,
                                      snapshot.data['id'],
                                      snapshot.data['nombre'],
                                      snapshot.data['developer'],
                                      snapshot.data['descripcion'],
                                      snapshot.data['img_url'],
                                      snapshot.data['lanzamiento']);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: nintendoPrimaryColor),
                                child: Text('Editar Datos'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Desarrollador: ',
                          style: TextStyle(
                              color: nintendoPrimaryColor, fontSize: 23),
                        ),
                        Text(
                          '${snapshot.data['developer']}',
                          style: TextStyle(fontSize: 23),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Lanzamiento: ',
                          style: TextStyle(
                              color: nintendoPrimaryColor, fontSize: 23),
                        ),
                        Text(
                          '${snapshot.data['lanzamiento']}',
                          style: TextStyle(fontSize: 23),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      height: 100,
                      child: Row(
                        children: [
                          // Text(
                          //   'Descripcion: ',
                          //   style: TextStyle(
                          //       color: nintendoPrimaryColor, fontSize: 23),
                          // ),
                          Flexible(
                            child: Text(
                              'Descripcion: ${snapshot.data['descripcion']}',
                              style: TextStyle(fontSize: 23),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          child: Text(
                            'Lista de Personajes',
                            style: TextStyle(
                                fontSize: 21, color: nintendoPrimaryColor),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: nintendoPrimaryColor),
                            onPressed: () {
                              goEditPersonajesJuego(
                                  context,
                                  snapshot.data['nombre'],
                                  snapshot.data['id'],
                                  snapshot.data['personajes']);
                              print("entró");
                            },
                            child: Text('Añadir'),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: size.height * 0.25,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: snapshot.data['personajes'].length != 0
                            ? snapshot.data['personajes'].length
                            : 1,
                        itemBuilder: (context, index) {
                          if (snapshot.data['personajes'].length == 0) {
                            print('holaa');
                            print(snapshot.data['personajes'].length);
                            return ListTile(
                              leading: Icon(MdiIcons.information),
                              title: Text('No se han agredado Personajes'),
                              // subtitle: Text('Por favor añada con el botón'),
                            );
                          } else {
                            return ListTile(
                              leading: Image.network(snapshot.data['personajes']
                                  [index]['img_url'] !=null?snapshot.data['personajes']
                                  [index]['img_url']:'https://i.imgur.com/GnkzOs4.png'),
                              title: Text(
                                  snapshot.data['personajes'][index]['nombre']),
                              subtitle: Text(snapshot.data['personajes'][index]
                                  ['occurrence']),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }

  void goEditPersonajesJuego(
      BuildContext context, String nombre, int id, List<dynamic> personajes) {
    final route = new MaterialPageRoute(
        builder: (context) => GamesAddPersonajes(
              nombre: nombre,
              id: id,
              personajes: personajes,
            ));
    Navigator.push(context, route).then((value) {
      setState(() {});
    });
  }

  void goEditJuego(BuildContext context, int id, String nombre, developer,
      descripcion, img, lanzamientos) {
    final route = new MaterialPageRoute(
        builder: (context) => EditJuego(
              id: id,
              nombre: nombre,
              developer: developer,
              descripcion: descripcion,
              img: img,
              lanzamiento: lanzamientos,
            ));
    Navigator.push(context, route).then((value) {
      setState(() {});
    });
  }
}
