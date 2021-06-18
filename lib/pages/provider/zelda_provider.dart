import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';

class ZeldaProvider {
  final String apiUrl = 'https://zelda-api.apius.cc/api';

  Future<LinkedHashMap<String, dynamic>> getAllCharacters(int numero) async {
    print('numero: $numero');
    var uri = Uri.parse('$apiUrl/characters?limit=50&page=$numero');

    var respuesta = await http.get(uri);
    // print(uri);
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return null;
    }
  }

  Future<LinkedHashMap<String, dynamic>> getAllCharactersNom(
      int numero, String nom) async {
    // print('numero: $numero');
    var uri = Uri.parse('$apiUrl/characters?name=$nom&limit=50&page=$numero');

    var respuesta = await http.get(uri);
    // print(uri);
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return null;
    }
  }

  Future<LinkedHashMap<String, dynamic>> getById(
      String dataset, String nombre, String id) async {
    var uri = Uri.parse('$apiUrl/$dataset/?name=$nombre');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      var dataset = json.decode(respuesta.body);
      var element;
      for (var i = 0; i < dataset['data'].length; i++) {
        if (dataset['data'][i]['_id'] == id) {
          element = dataset['data'][i];
          break;
        }
      }
      return element;
    } else {
      return null;
    }
  }

  Future<LinkedHashMap<String, dynamic>> getFirstGame(link) async {
    var uri = Uri.parse(link);
    var respuesta = await http.get(uri);
    await Future.delayed(Duration(seconds: 10));

    // print(uri);
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return null;
    }
  }
}
