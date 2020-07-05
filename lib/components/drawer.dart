import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  buildOptions() {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        ListTile(
          title: Text("Todas as Notícias"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Cascavel"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Esportes"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Internacional"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Economia"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Entretenimento"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Brasil"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Paraná"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Política"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Achados e Perdidos"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Empregos"),
          onTap: () {},
        ),
      ],
    );
  }

  buildDrawer() {
    return Drawer(
      child: buildOptions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildDrawer();
  }
}