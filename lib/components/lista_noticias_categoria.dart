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
  List<Noticia> futureNoticia;
  var noticias = <Widget>[];

  ScrollController scroll = ScrollController();

  TextEditingController editingController = TextEditingController();

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
    carregarNoticias();
  }

  carregarNoticias() async {
    var noticias = await fetchNoticiaCategoria(categoria);

    setState(() {
      futureNoticia = noticias;
    });
  }

  buildList() {
    if (futureNoticia != null) {
      for (Noticia noticia in futureNoticia) {
        noticias.add(CardComponent(noticia: noticia));
      }
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView(
      controller: scroll,
      children: noticias,
    );
  }

  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {});

    return null;
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
            child: BuildSearch.buildSearch(editingController, (String value) {
              if (value.isNotEmpty) {
                print(value);
              }
            }),
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
      body: RefreshIndicator(
        child: buildHome(),
        onRefresh: refresh,
      ),
      floatingActionButton: ButtonComponent(scroll: scroll),
    );
  }
}
