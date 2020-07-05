import 'package:OnNews/components/lista_noticias_categoria.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  buildOptions(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        ListTile(
          title: Text("Cascavel"),
          onTap: () {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaNoticiasCategoria(
                  categoria: "1",
                )
              ),
            );
          },
        ),
        ListTile(
          title: Text("Esportes"),
          onTap: () {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaNoticiasCategoria(
                  categoria: "2",
                )
              ),
            );
          },
        ),
        ListTile(
          title: Text("Internacional"),
          onTap: () {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaNoticiasCategoria(
                  categoria: "3",
                )
              ),
            );
          },
        ),
        ListTile(
          title: Text("Economia"),
          onTap: () {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaNoticiasCategoria(
                  categoria: "4",
                )
              ),
            );
          },
        ),
        ListTile(
          title: Text("Entretenimento"),
          onTap: () {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaNoticiasCategoria(
                  categoria: "5",
                )
              ),
            );
          },
        ),
        ListTile(
          title: Text("Brasil"),
          onTap: () {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaNoticiasCategoria(
                  categoria: "6",
                )
              ),
            );
          },
        ),
        ListTile(
          title: Text("Paraná"),
          onTap: () {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaNoticiasCategoria(
                  categoria: "7",
                )
              ),
            );
          },
        ),
        ListTile(
          title: Text("Política"),
          onTap: () {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaNoticiasCategoria(
                  categoria: "176",
                )
              ),
            );
          },
        ),
        ListTile(
          title: Text("Achados e Perdidos"),
          onTap: () {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaNoticiasCategoria(
                  categoria: "177",
                )
              ),
            );
          },
        ),
        ListTile(
          title: Text("Empregos"),
          onTap: () {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaNoticiasCategoria(
                  categoria: "178",
                )
              ),
            );
          },
        ),
      ],
    );
  }

  buildDrawer(BuildContext context) {
    return Drawer(
      child: buildOptions(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildDrawer(context);
  }
}
