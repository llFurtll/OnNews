import 'dart:async';
import 'package:OnNews/api/future_noticias.dart';
import 'package:OnNews/api/noticias.dart';
import 'package:OnNews/components/button.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import 'cards.dart';
import 'drawer.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<Noticia>> futureNoticia;

  GlobalKey<ScaffoldState> key = GlobalKey();

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
            itemCount: 100,
            itemBuilder: (context, index) {
              return CardComponent(
                noticia: snapshot.data[index],
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBarComponent(key: key).build(context),
      body: Scaffold(
        key: key,
        drawer: DrawerComponent(),
        body: Center(
          child: buildList(),
        ),
      ),
      floatingActionButton: ButtonComponent(futureNoticia: futureNoticia),
    );
  }
}
