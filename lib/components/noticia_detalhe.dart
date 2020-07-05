import 'package:OnNews/api/noticias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class NoticiaDetalhe extends StatelessWidget {
  Noticia noticia;

  NoticiaDetalhe({this.noticia});

  buildNoticia() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(noticia.img),
          Html(
            data: noticia.conteudo,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Html(
          data: "<h2>${noticia.title}<h2>",
          style: {
            "h2": Style(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
          },
          ),
      ),
      body: buildNoticia(),
    );
  }
}