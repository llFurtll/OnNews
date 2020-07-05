import 'package:OnNews/api/noticias.dart';
import 'package:OnNews/components/noticia_detalhe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class CardComponent extends StatelessWidget {
  Noticia noticia;

  CardComponent({this.noticia});

  static CardBuild(Noticia noticia, BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shadowColor: Colors.lightBlue,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoticiaDetalhe(noticia: noticia,)
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(noticia.img, repeat: ImageRepeat.noRepeat),
            Html(
              data: "<h2>${noticia.title}<h2>",
              style: {
                "h2": Style(
                  textAlign: TextAlign.start,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                ),
              }
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(noticia.categoria.first, style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).accentColor,
              ),),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardBuild(this.noticia, context);
  }
}