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

}