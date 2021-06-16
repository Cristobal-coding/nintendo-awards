import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';

class ZeldaProvider {
  final String apiUrl = 'https://zelda-api.apius.cc/api/';

  // Future<List<dynamic>> getMa() async {
  //   var uri = Uri.parse('$apiUrl/marcas');
  //   var respuesta = await http.get(uri);

  //   if (respuesta.statusCode == 200) {
  //     return json.decode(respuesta.body);
  //   } else {
  //     return null;
  //   }
  //   // if (respuesta.statusCode == 200) {
  //   //   if (respuesta.body.isNotEmpty) {
  //   //     return json.decode(respuesta.body);
  //   //   } else {
  //   //     return null;
  //   //   }
  //   // } else {
  //   //   return null;
  //   // }
  // }
  
  Future<LinkedHashMap<String, dynamic>> getById(String dataset, String nombre, String id) async {
    var uri = Uri.parse('$apiUrl$dataset/?name=$nombre');
    var respuesta = await http.get(uri);
  
    if (respuesta.statusCode == 200) {
      var dataset = json.decode(respuesta.body);
      var element;
      for( var i = 0 ; i <dataset['data'].length; i++ ) { 
        if(dataset['data'][i]['_id'] == id){
          element=dataset['data'][i];
        }
      } 
      return element;
    } else {
      return null;
    }
  }
 
}
