import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/form_personaje.dart';
import 'package:nintendo_awards/pages/provider/mario_provider.dart';
import 'package:nintendo_awards/pages/widgets/juego.dart';
import 'package:nintendo_awards/pages/widgets/personaje.dart';

class MarioPage extends StatefulWidget {
  const MarioPage({Key key}) : super(key: key);

  @override
  _MarioPageState createState() => _MarioPageState();
}

class _MarioPageState extends State<MarioPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MarioProvider mario = new MarioProvider();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical:15.0 ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(MdiIcons.crown, color: Colors.yellow[700], size: 30,),
                Text(
                  'Personajes Famosos',
                  style: TextStyle(fontSize: 20,),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: ()=> goNewCharacter(context),
                  style: ElevatedButton.styleFrom(
                    primary: nintendoPrimaryColor    
                    ),
                  child: Row(
                    children: [
                      Icon(MdiIcons.plus),
                      Text('Nuevo')
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: size.height * 0.34,
            width: double.infinity,
            child: FutureBuilder(
                future: mario.getAll('personajes'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => Divider(),
                      itemCount: snapshot.data['results'].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print(snapshot.data['results'][index]['nombre']);
                          },
                          child: Personaje(
                            pathImage: snapshot.data['results'][index]['img_url'],
                            genero: snapshot.data['results'][index]['genero'],
                            nombre: snapshot.data['results'][index]['nombre'],
                            fecha: snapshot.data['results'][index]['occurrence'],
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(MdiIcons.lightningBolt, size: 30, color:Colors.yellow[700] ,),
                Text(
                  'Juegos Destacados',
                  style: TextStyle(fontSize: 20,),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: nintendoPrimaryColor    
                    ),
                  child: Row(
                    children: [
                      Icon(MdiIcons.plus),
                      Text('Nuevo')
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: size.height * 0.34,
            width: double.infinity,
            child: FutureBuilder(
                future: mario.getAll('juegos'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => Divider(),
                      itemCount: snapshot.data['results'].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print(snapshot.data['results'][index]['nombre']);
                          },
                          child: Juego(
                            pathImage: snapshot.data['results'][index]['img_url'],
                            genero: snapshot.data['results'][index]['developer'],
                            nombre: snapshot.data['results'][index]['nombre'],
                            fecha: snapshot.data['results'][index]['lanzamiento'],
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  void goNewCharacter(BuildContext context) {
    final route = new MaterialPageRoute(builder: (context) => FormPersonaje());
    Navigator.push(context, route).then((valor) {
      setState(() {});
    });
  }
}
