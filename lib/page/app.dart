import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/album.dart';
import 'package:flutter_application/servicios/obtenerAlbum.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = obtenerAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Celulares"),
        actions: [
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
      body: FutureBuilder<Album>(
        future: obtenerAlbum(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Album> celulares = snapshot.data;
            return ListView(
                children: celulares
                    .map((celular) => ListTile(
                          leading: Icon(Icons.phone_android),
                          title: Text(celular.title),
                          subtitle: Text(celular.title),
                        ))
                    .toList()
                  ..add(ListTile())
                  ..add(ListTile()));
          } else {
            return Center(
              child: Text("cargando..."),
            );
          }
        },
      ),
    );
  }
}
