import 'dart:async';
import 'package:OnNews/api/future_noticias.dart';
import 'package:OnNews/api/noticias.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import 'cards.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<Noticia>> futureNoticia;


  @override
  initState() {
    super.initState();
    futureNoticia = fetchNoticia();
  }

  buildList() {
    return FutureBuilder<List<Noticia>>(
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
          itemCount: 50,
          itemBuilder: (context, index) {
            return CardComponent(
              snapshot.data[index].id,
              snapshot.data[index].img, 
              snapshot.data[index].title,
              snapshot.data[index].categoria.first
            );
          },
        );
      }
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
              futureNoticia = fetchNoticia();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent().build(context),

      body: Center(
        child: buildList(),
      ),

      floatingActionButton: buildFloatAction(),
    );
  } 
}