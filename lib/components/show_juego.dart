import 'package:flutter/material.dart';
import 'package:nintendo_awards/constants.dart';
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
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(
                            snapshot.data['img_url'],
                            width: 140,
                            height: 220,
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 0),
                              child: Container(
                                  child: Text(
                                snapshot.data['nombre'],
                                style: TextStyle(fontSize: 30),
                              )),
                            ),
                            Container(
                              width: 200,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/images/family4.png'),
                                ),
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
                    Text(
                      'Lista de Personajes',
                      style:
                          TextStyle(fontSize: 21, color: nintendoPrimaryColor),
                    ),
                    Container(
                      width: double.infinity,
                      height: size.height * 0.37,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: snapshot.data['personajes'].length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(snapshot.data['personajes'][index]['img_url']),
                            title: Text(
                                snapshot.data['personajes'][index]['nombre']),
                            subtitle: Text(snapshot.data['personajes'][index]
                                ['occurrence']),
                          );
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
}
