import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:http/http.dart' as http;
import 'package:nintendo_awards/pages/widgets/hongo_progress_indicator.dart';

class Juego extends StatelessWidget {
  const Juego({
    this.fecha,
    this.nombre,
    this.genero,
    this.pathImage,
    Key key,
  }) : super(key: key);
  final String pathImage, nombre, fecha, genero;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: http.get(Uri.parse(pathImage)),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
              width: 200,
              height: 500,
              child: Center(child: HongoProgressIndicator(font: 50)));
        } else {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 8),
            width: 200,
            height: 500,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(30),
              // boxShadow: [
              //   BoxShadow(
              //       color: nintendoIconsColor,
              //       blurRadius: 4.0,
              //       spreadRadius: 0.0,
              //       offset: Offset(2.0, 1.0),
              //   )
              // ],
              image: DecorationImage(
                  fit: pathImage.contains('GnkzOs4')
                      ? BoxFit.fitWidth
                      : BoxFit.fill,
                  image: NetworkImage(
                    pathImage,
                  )),
            ),
            child: Column(
              children: [
                Spacer(),
                Container(
                  width: double.infinity,
                  height: 72,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.vertical(
                    //   top: Radius.circular(0),
                    //   bottom: Radius.circular(30),
                    // ),
                    color: nintendoPrimaryColor.withOpacity(0.8),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Text(
                        this.nombre,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )),
                      Row(
                        children: [
                          Text(
                            this.genero,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Spacer(),
                          // Icon(MdiIcons.cart, color: Colors.white,),
                          Text(
                            this.fecha,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
// Container(
//             margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 8),
//             width: 200,
//             height: 500,
//             decoration: BoxDecoration(
//               // borderRadius: BorderRadius.circular(30),
//               // boxShadow: [
//               //   BoxShadow(
//               //       color: nintendoIconsColor,
//               //       blurRadius: 4.0,
//               //       spreadRadius: 0.0,
//               //       offset: Offset(2.0, 1.0),
//               //   )
//               // ],
//               image: DecorationImage(
//                   fit: pathImage.contains('GnkzOs4')
//                       ? BoxFit.fitWidth
//                       : BoxFit.fill,
//                   image: NetworkImage(
//                     pathImage,
//                   )),
//             ),
//             child: Column(
//               children: [
//                 Spacer(),
//                 Container(
//                   width: double.infinity,
//                   height: 72,
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
//                   decoration: BoxDecoration(
//                     //   borderRadius: BorderRadius.vertical(
//                     //   top: Radius.circular(0),
//                     //   bottom: Radius.circular(30),
//                     // ),
//                     color: nintendoPrimaryColor.withOpacity(0.8),
//                   ),
//                   child: Column(
//                     // crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                           child: Text(
//                         this.nombre,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25),
//                       )),
//                       Row(
//                         children: [
//                           Text(
//                             this.genero,
//                             style: TextStyle(color: Colors.white, fontSize: 12),
//                           ),
//                           Spacer(),
//                           // Icon(MdiIcons.cart, color: Colors.white,),
//                           Text(
//                             this.fecha,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );