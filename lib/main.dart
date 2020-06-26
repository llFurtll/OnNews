import 'package:flutter/material.dart';
import 'components/appbar.dart';
import 'components/cards.dart';
import 'components/button.dart';
import 'api/noticias.dart';
import './api/future_noticias.dart';

void main() => runApp(OnNews(futureNoticia: fetchNoticia()));

class OnNews extends StatefulWidget {
  Future<List<Noticia>> futureNoticia;
  
  OnNews({Key key, this.futureNoticia}) : super(key: key);

  @override
  OnNewsState createState() => OnNewsState(futureNoticia: futureNoticia);
}

class OnNewsState extends State<OnNews> {
  Future<List<Noticia>> futureNoticia;

  OnNewsState({this.futureNoticia});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarComponent().build(context),
        body: Center(
          child: FutureBuilder<List<Noticia>>(
            future: futureNoticia,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return CardComponent(
                      snapshot.data[index].id,
                      snapshot.data[index].img, 
                      snapshot.data[index].title,
                      snapshot.data[index].categoria
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("$snapshot.error");
              }
              return Center(
                child: CircularProgressIndicator(), 
              );
            }
          ),
        ),
        floatingActionButton: ButtonComponent().build(context),
      ),
    );
  }
}