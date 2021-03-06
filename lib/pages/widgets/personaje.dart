import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/constants.dart';

class Personaje extends StatelessWidget {
  const Personaje({
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 700,
        width: size.width * 0.5,
        child: Stack(
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                pathImage,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      // backgroundColor: Colors.red,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(nintendoPrimaryColor),
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: nintendoPrimaryColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: size.height * 0.05,
                width: size.width * 0.5,
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        this.nombre,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         this.genero,
                      //         style:
                      //             TextStyle(color: Colors.white, fontSize: 12),
                      //       ),
                      //       Spacer(),
                      //       // Icon(MdiIcons.cart, color: Colors.white,),
                      //       Text(
                      //         this.fecha,
                      //         style: TextStyle(
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: 15),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ]),
              ),
            ),
          ],
        ),
        // margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        // width: 200,
        // height: 500,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(30),
        //   // boxShadow: [
        //   //   BoxShadow(
        //   //       color: nintendoIconsColor,
        //   //       blurRadius: 4.0,
        //   //       spreadRadius: 0.0,
        //   //       offset: Offset(2.0, 1.0),
        //   //   )
        //   // ],
        //   image: DecorationImage(
        //       fit: pathImage.contains('GnkzOs4') ? BoxFit.fitWidth : BoxFit.fill,
        //       // image:  CircularProgressIndicator()
        //       image: NetworkImage(
        //         pathImage,
        //       )),
        // ),
        // child: Column(
        //   children: [
        //     Spacer(),
        //     Container(
        //       width: double.infinity,
        //       height: 72,
        //       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.vertical(
        //           top: Radius.circular(0),
        //           bottom: Radius.circular(30),
        //         ),
        //         color: nintendoPrimaryColor.withOpacity(0.8),
        //       ),
        //       child: Column(
        //         // crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Expanded(
        //               child: Text(
        //             this.nombre,
        //             style: TextStyle(
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 25),
        //           )),
        //           Row(
        //             children: [
        //               Text(
        //                 this.genero,
        //                 style: TextStyle(color: Colors.white, fontSize: 12),
        //               ),
        //               Spacer(),
        //               // Icon(MdiIcons.cart, color: Colors.white,),
        //               Text(
        //                 this.fecha,
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 15),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
