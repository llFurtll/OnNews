import 'dart:async';
import 'package:OnNews/api/future_noticias.dart';
import 'package:OnNews/api/noticias.dart';
import 'package:flutter/material.dart';
import 'cards.dart';

class ListaNoticiasCategoria extends StatefulWidget {
  String categoria;

  ListaNoticiasCategoria({this.categoria});

  @override
  ListaNoticiasCategoriaState createState() =>
      ListaNoticiasCategoriaState(categoria: categoria);
}

class ListaNoticiasCategoriaState extends State<ListaNoticiasCategoria> {
  String categoria;
  Future<List<Noticia>> futureNoticia;

  ListaNoticiasCategoriaState({this.categoria});

  Map listaNoticias = {
    "1": "Cascavel",
    "2": "Esportes",
    "3": "Internacional",
    "4": "Economia",
    "5": "Entretenimento",
    "6": "Brasil",
    "7": "Paraná",
    "176": "Política",
    "177": "Achados e Perdidos",
    "178": "Empregos",
  };

  @override
  initState() {
    super.initState();
    futureNoticia = fetchNoticiaCategoria(categoria);
  }

  buildList() {
    return FutureBuilder(
      future: futureNoticia,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text("$snapshot.error");
        }
        return ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return CardComponent(
              noticia: snapshot.data[index],
            );
          },
        );
      },
    );
  }

  buildFloatAction() {
    return Builder(
      builder: (BuildContext context) {
        return FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Theme.of(context).accentColor,
          tooltip: "Atualizar Lista",
          onPressed: () {
            setState(() {
              futureNoticia = fetchNoticiaCategoria(categoria);
              Timer(Duration(seconds: 1), () {
                final snackbar = SnackBar(
                  content: Text("Lista Atualizada"),
                );
                Scaffold.of(context).showSnackBar(snackbar);
              });
            });
          },
        );
      },
    );
  }

  buildAppbar(BuildContext context) {
    return AppBar(
      title: Text("${listaNoticias[categoria]}"),
      centerTitle: true,
      backgroundColor: Theme.of(context).accentColor,
      leading: IconButton(
        tooltip: "Voltar para Home",
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: buildAppbar(context),
      body: Center(
        child: buildList(),
      ),
      floatingActionButton: buildFloatAction(),
    );
  }
}
