import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';

class MarioProvider {
  final String apiUrl = 'http://192.168.0.7:8000/api';

  Future<LinkedHashMap<String, dynamic>> getAll(String set) async {
    var uri = Uri.parse('$apiUrl/$set');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return null;
    }
  }
  Future<LinkedHashMap<String, dynamic>> getOneById(String set,id) async {
    var uri = Uri.parse('$apiUrl/$set/$id');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      print(uri);
      return json.decode(respuesta.body);
    } else {
      return null;
    }
  }
  Future<LinkedHashMap<String, dynamic>> getJuego(int id) async {
    var uri = Uri.parse('$apiUrl/juegos/$id');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return null;
    }
  }
  Future<http.Response> deletePersonaje(String nombre) async {
    var uri = Uri.parse('$apiUrl/personajes/$nombre');
    return await http.delete(uri);

  }
  Future<http.Response> deleteJuego(int id) async {
    var uri = Uri.parse('$apiUrl/juegos/$id');
    return await http.delete(uri);

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

  }
  Future<LinkedHashMap<String, dynamic>> updatePersonaje(String id,nombre, ocurrence, genero, creator, raza, img) async {
    var uri = Uri.parse('$apiUrl/personajes/$id');
    if (img != '' ) {
      var respuesta = await http.put(uri,
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
      var respuesta = await http.put(uri,
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
  }
  Future<LinkedHashMap<String, dynamic>> destroyElementPivot(int id,String nombre) async {
    var uri = Uri.parse('$apiUrl/juegos/$id/pivot/$nombre');
    var respuesta = await http.delete(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return null;
    }
  }
  Future<LinkedHashMap<String, dynamic>> updateElementPivot(int id,String nombre,previousNombre) async {
    var uri = Uri.parse('$apiUrl/juegos/$id/update/$nombre/previous/$previousNombre');
    var respuesta = await http.put(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return null;
    }
  }
  Future<LinkedHashMap<String, dynamic>> addElementPivot(int id,String nombre) async {
    var uri = Uri.parse('$apiUrl/juegos/$id/new/$nombre');
    var respuesta = await http.post(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return null;
    }
  }
}
