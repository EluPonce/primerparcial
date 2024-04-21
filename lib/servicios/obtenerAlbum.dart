import 'dart:convert';
import 'package:flutter_application/models/album.dart';
import 'package:http/http.dart' as http;

Future<Album> obtenerAlbum() async {
  final response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Album>> getAlbum() async {
  String url = "https://jsonplaceholder.typicode.com/albums";
  final respuesta = await http.get(Uri.https(url));

  if (respuesta.statusCode == 200) {
    String datos = respuesta.body;
    var jsonDatos = json.decode(datos);
    return jsonDatos.celulares.fromJson(jsonDatos);
  }
  return [];
}
