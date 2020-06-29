import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  int id;
  String img;
  String title;
  String categoria;

  CardComponent(int id, String img, String title, String categoria) {
    this.id = id;
    this.img = img;
    this.title = title;
    this.categoria = categoria;
  }

  static CardBuild(int id, String img, String title, String categoria) {
    return Card(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shadowColor: Colors.lightBlue,
      child: InkWell(
        onTap: () {
          print("Card ${id} Pressionado");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(img, repeat: ImageRepeat.noRepeat),
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
    return CardBuild(id, img, title, categoria);
  }
}