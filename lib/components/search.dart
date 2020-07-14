import 'package:OnNews/api/noticias.dart';
import 'package:flutter/material.dart';

class BuildSearch extends StatefulWidget {
  Future<List<Noticia>> noticias;
  TextEditingController editingController = TextEditingController();

  BuildSearch({this.noticias, this.editingController});

  @override
  BuildSearchState createState() => BuildSearchState(noticias: noticias, editingController: editingController);
}

class BuildSearchState extends State<BuildSearch> {
  TextEditingController editingController = TextEditingController();
  Future<List<Noticia>> noticias;

  BuildSearchState({this.noticias, this.editingController});

  filtrarNoticias(String query) {
    return "";
  }

buildSearch(TextEditingController editingController) {
  return TextField(
    onChanged: (value) {
    },
    controller: editingController,
    decoration: InputDecoration(
      labelText: "Pesquisar",
      hintText: "Pesquisar",
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0))
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return buildSearch(editingController);
  }
}