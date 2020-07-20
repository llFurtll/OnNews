import 'package:OnNews/api/noticias.dart';
import 'package:flutter/material.dart';
class BuildSearch extends StatefulWidget {
  Future<List<Noticia>> noticias;
  TextEditingController editingController;

  BuildSearch({this.noticias, this.editingController});

  @override
  BuildSearchState createState() => BuildSearchState();
}

class BuildSearchState extends State<BuildSearch> {

  buildSearch() {
    return TextField(
      onChanged: (value) {
      },
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
    return buildSearch();
  }
}
