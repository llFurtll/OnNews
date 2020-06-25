import 'dart:convert';
import 'package:flutter/material.dart';
import 'components/appbar.dart';
import 'components/cards.dart';
import 'components/button.dart';
import 'api/noticias.dart';
import 'package:http/http.dart' as http;

Future<Noticia> fetchNoticia() async {
  final response = await http.get('https://cgn.inf.br/wp-json/wp/v2/posts');

  if (response.statusCode == 200) {
    return Noticia.fromJson(json.decode(response.body));
  } else {
    throw Exception('Falha ao carregar');
  }
}

void main() => runApp(OnNews(futureNoticia: fetchNoticia()));

class OnNews extends StatelessWidget {
  Future<Noticia> futureNoticia;

  OnNews({Key key, this.futureNoticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarComponent().build(context),
        body: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: FutureBuilder<Noticia>(
            future: futureNoticia,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("$snapshot.error");
              }
              return CircularProgressIndicator();
            }
          ),
        ),
        floatingActionButton: ButtonComponent().build(context),
      ),
    );
  }
}