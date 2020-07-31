import 'package:OnNews/api/future_noticias.dart';
import 'package:OnNews/api/noticias.dart';
import 'package:OnNews/components/button.dart';
import 'package:OnNews/components/search.dart';
import 'package:flutter/material.dart';
import '../api/future_noticias.dart';
import 'appbar.dart';
import 'cards.dart';
import 'drawer.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List<Noticia> futureNoticia;
  var listaNoticias = <Widget>[];

  GlobalKey<ScaffoldState> key = GlobalKey();

  ScrollController scroll = ScrollController();

  TextEditingController editingController = TextEditingController();

  @override
  initState() {
    super.initState();
    carregarNoticias();
  }

  carregarNoticias() async {
    var noticias = await fetchNoticia();

    setState(() {
      futureNoticia = noticias;
    });
  }

  buildList() {
    if (futureNoticia != null) {
      for (Noticia noticia in futureNoticia) {
        listaNoticias.add(CardComponent(noticia: noticia));
      }
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView(
      controller: scroll,
      children: listaNoticias,
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
      appBar: AppBarComponent(key: key).build(context),
      body: Scaffold(
        key: key,
        drawer: DrawerComponent(),
        body: RefreshIndicator(
          child: buildHome(),
          onRefresh: () async {
            setState(() {});
          }
        ),
      ),
      floatingActionButton: ButtonComponent(scroll: scroll),
    );
  }
}
