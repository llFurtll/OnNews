import 'dart:async';
import 'package:OnNews/api/future_noticias.dart';
import 'package:OnNews/api/noticias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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

  buildButtons() {
    return Builder(
      builder: (BuildContext context) {
        return SpeedDial(
          marginBottom: 20,
          marginRight: 18,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          visible: true,
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.white,
          overlayOpacity: 0.5,
          onOpen: () {},
          onClose: () {},
          tooltip: "Ações",
          backgroundColor: Theme.of(context).accentColor,
          foregroundColor: Colors.white,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Icons.refresh),
              backgroundColor: Theme.of(context).accentColor,
              foregroundColor: Colors.white,
              label: "Atualizar Lista",
              onTap: () {
                setState(() {
                  futureNoticia = fetchNoticia();
                  Timer(Duration(seconds: 1), () {
                    final snackbar = SnackBar(
                      content: Text("Lista Atualizada"),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  });
                });
              }
            ),
          ],
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
      floatingActionButton: buildButtons(),
    );
  }
}
