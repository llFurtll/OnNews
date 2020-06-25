import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  String img;
  String title;
  String categoria;

  CardComponent(String img, String title, String categoria) {
    this.img = img;
    this.title = title;
    this.categoria = categoria;
  }

  static CardBuild(String img, String title, String categoria) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shadowColor: Colors.lightBlue,
      child: InkWell(
        onTap: () {
          print("Card Pressionado");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(img, fit: BoxFit.none, width: 350.0, height: 340.0),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(title, style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25.0,
              ),),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Text(categoria, style: TextStyle(
                fontSize: 20.0,
                color: Colors.purple,
              ),),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardBuild(img, title, categoria);
  }
}