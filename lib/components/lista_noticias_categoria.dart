import 'dart:async';
import 'package:OnNews/api/future_noticias.dart';
import 'package:OnNews/api/noticias.dart';
import 'package:OnNews/components/button.dart';
import 'package:OnNews/components/search.dart';
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
  
  ScrollController scroll = ScrollController();

  ListaNoticiasCategoriaState({this.categoria});

  TextEditingController editingController = TextEditingController();

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
          controller: scroll,
          itemBuilder: (context, index) {
            return CardComponent(
              noticia: snapshot.data[index],
            );
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

  buildHome() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: BuildSearch(noticias: futureNoticia, editingController: editingController),
          ),
          Expanded(
            child: buildList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: buildAppbar(context),
      body: buildHome(),
      floatingActionButton: ButtonComponent(futureNoticia: futureNoticia, scroll: scroll),
    );
  }
}
