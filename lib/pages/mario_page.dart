import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/provider/mario_provider.dart';
import 'package:nintendo_awards/pages/widgets/juego.dart';
import 'package:nintendo_awards/pages/widgets/personaje.dart';

class MarioPage extends StatelessWidget {
  const MarioPage({Key key}) : super(key: key);

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
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: size.height * 0.35,
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
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: size.height * 0.35,
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

  // return Padding(
  //     padding: const EdgeInsets.all(12.0),
  //     child: Container(
  //       width: size.width,
  //       height: size.height * 0.4,
  //       color: Colors.blue,
  //       child: ListView(
  //         scrollDirection: Axis.horizontal,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: InkWell(
  //               onTap: () {},
  //               child: Container(
  //                 color: Colors.green,
  //                 width: size.width * 0.55,
  //                 height: size.height * 0.4,
  //                 child: Column(
  //                   children: [
  //                     Container(
  //                       width: size.width * 0.55,
  //                       height: size.height * 0.1,
  //                       color: Colors.red,
  //                       padding: EdgeInsets.all(8),
  //                       child: Text(
  //                         "Titulo poooooooooooooo ",
  //                         overflow: TextOverflow.ellipsis,
  //                         maxLines: 2,
  //                         style: TextStyle(fontSize: 20),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Container(
  //                         height: size.height * 0.24,
  //                         width: size.width * 0.5,
  //                         color: Colors.white,
  //                         child: Image.network(
  //                           'https://i.imgur.com/yuz1Cuu.jpg',
  //                           // height: size.height * 0.24, //'url entre comillas'
  //                           // width: size.width * 0.5,
  //                           loadingBuilder: (BuildContext context, Widget child,
  //                               ImageChunkEvent loadingProgress) {
  //                             if (loadingProgress == null) return child;
  //                             return Center(
  //                               child: CircularProgressIndicator(
  //                                 // backgroundColor: Colors.red,
  //                                 valueColor: AlwaysStoppedAnimation<Color>(
  //                                     nintendoPrimaryColor),
  //                                 value: loadingProgress.expectedTotalBytes !=
  //                                         null
  //                                     ? loadingProgress.cumulativeBytesLoaded /
  //                                         loadingProgress.expectedTotalBytes
  //                                     : null,
  //                               ),
  //                             );
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
}
