import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/constants.dart';

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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 8),
      width: 200,
      height: size.height * 0.4,
      child: Stack(
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Image.network(
              pathImage,
              fit:
                  pathImage.contains('GnkzOs4') ? BoxFit.fitWidth : BoxFit.fill,
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
              color: nintendoPrimaryColor.withOpacity(0.9),
              height: size.height * 0.05,
              width: size.width * 0.5,
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        this.nombre,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    )
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         this.genero,
                    //         style: TextStyle(color: Colors.white, fontSize: 12),
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
    );
  }
}
