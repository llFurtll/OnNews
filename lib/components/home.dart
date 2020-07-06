import 'dart:async';
import 'package:OnNews/api/future_noticias.dart';
import 'package:OnNews/api/noticias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'appbar.dart';
import 'cards.dart';
import 'drawer.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<Noticia>> futureNoticia;

  GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBarComponent().build(context),
      drawer: DrawerComponent(),
      body: Center(
          child: buildList(),
        ),
      floatingActionButton: buildButtons(),
    );
  }
}
