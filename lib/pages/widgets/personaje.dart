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
  final String  pathImage,nombre, fecha, genero;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal:10.0, vertical: 8),
      width: 200,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // boxShadow: [
        //   BoxShadow(
        //       color: nintendoIconsColor,
        //       blurRadius: 4.0,
        //       spreadRadius: 0.0,
        //       offset: Offset(2.0, 1.0), 
        //   )
        // ],
        image: DecorationImage(
          fit: BoxFit.fill,
          // image:  CircularProgressIndicator()
          image:  NetworkImage(pathImage, )
        ),
      ),
      child: Column(
        children: [
          Spacer(),
          Container(
            width: double.infinity,
            height: 72,
            padding: EdgeInsets.symmetric(horizontal:10.0, vertical:4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
              top: Radius.circular(0),
              bottom: Radius.circular(30),
            ),
              color: nintendoPrimaryColor.withOpacity(0.8),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text(this.nombre, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),)),
                Row(
                  children: [
                    Text(this.genero, style: TextStyle(color: Colors.white, fontSize: 12),),
                    Spacer(),
                    // Icon(MdiIcons.cart, color: Colors.white,),
                    Text(this.fecha, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}