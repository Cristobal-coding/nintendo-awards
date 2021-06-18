import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';

class MarioProvider {
  final String apiUrl = 'http://192.168.0.6:8000/api';

  Future<LinkedHashMap<String, dynamic>> getAll(String set) async {
    var uri = Uri.parse('$apiUrl/$set');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return null;
    }
  }

  Future<LinkedHashMap<String, dynamic>> addPersonaje(String nombre, ocurrence, genero, creator, raza, img) async {
    var uri = Uri.parse('$apiUrl/personajes');
    if (img != '') {
      var respuesta = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'nombre': nombre,
            'occurrence': ocurrence,
            'genero': genero,
            'creator': creator,
            'raza': raza,
            'img_url': img,
          }));
      return json.decode(respuesta.body);
    } else {
      var respuesta = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'nombre': nombre,
            'occurrence': ocurrence,
            'genero': genero,
            'creator': creator,
            'raza': raza,
          }));
      return json.decode(respuesta.body);
    }

    // if (respuesta.body.isNotEmpty) {
    //   return json.decode(respuesta.body);
    // } else {
    //   return null;
    // }
  }
}
