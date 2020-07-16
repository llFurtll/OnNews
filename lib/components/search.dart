import 'package:OnNews/api/noticias.dart';
import 'package:flutter/material.dart';

class BuildSearch extends StatefulWidget {
  Future<List<Noticia>> noticias;
  TextEditingController editingController = TextEditingController();

  BuildSearch({this.noticias, this.editingController});

  @override
  BuildSearchState createState() => BuildSearchState(
      noticias: noticias, editingController: editingController);
}

class BuildSearchState extends State<BuildSearch> {
  TextEditingController editingController = TextEditingController();
  Future<List<Noticia>> noticias;

  BuildSearchState({this.noticias, this.editingController});

  filtrarNoticias(String query, Future<List<Noticia>> listaNoticia) {
    Future<List<Noticia>> noticiasSalvas = listaNoticia;
    if (query.isNotEmpty) {
      Future<List<Noticia>> noticiasFiltradas = listaNoticia;
      listaNoticia.then((noticias) {
        noticias.forEach((elementoNoticia) {
          if (elementoNoticia.title.contains(query)) {
            setState(() {
              noticiasFiltradas.then((value) {
                value.clear();
                value.add(elementoNoticia);
              });
              listaNoticia = noticiasFiltradas;
            });
          }
        });
      });
      return;
    }
  }

  buildSearch(TextEditingController editingController) {
    return TextField(
      onChanged: (value) {
        filtrarNoticias(value, noticias);
      },
      controller: editingController,
      decoration: InputDecoration(
        labelText: "Pesquisar",
        hintText: "Pesquisar",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildSearch(editingController);
  }
}
