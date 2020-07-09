import 'dart:async';
import 'package:OnNews/api/future_noticias.dart';
import 'package:OnNews/api/noticias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ButtonComponent extends StatefulWidget {
  Future<List<Noticia>> futureNoticia;
  
  ButtonComponent({this.futureNoticia});

  @override
  ButtonComponentState createState() => ButtonComponentState(futureNoticia: futureNoticia);
}

class ButtonComponentState extends State<ButtonComponent> {
  Future<List<Noticia>> futureNoticia;

  ButtonComponentState({this.futureNoticia});

  ScrollController scroll = ScrollController();

  @override
  initState() {
    super.initState();
  }

  backPositionTop() {
    scroll.animateTo(
      0.0, 
      duration: Duration(seconds: 2), 
      curve: Curves.fastOutSlowIn);
  }
  
  buildButton() {
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
                  this.futureNoticia = fetchNoticia();
                  Timer(Duration(seconds: 1), () {
                    final snackbar = SnackBar(
                      content: Text("Lista Atualizada"),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  });
                });
              }
            ),
            SpeedDialChild(
              child: Icon(Icons.arrow_upward),
              backgroundColor: Theme.of(context).accentColor,
              foregroundColor: Colors.white,
              label: "Voltar para o topo",
              onTap: () {
                backPositionTop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildButton();
  }
}