import 'package:flutter/material.dart';

class BuildSearch extends StatefulWidget {
  Function filtrarNoticias;
  TextEditingController editingController = TextEditingController();

  BuildSearch({this.filtrarNoticias, this.editingController});
  
  @override
  BuildSearchState createState() => BuildSearchState(filtrarNoticias: filtrarNoticias, editingController: editingController);
}

class BuildSearchState extends State<BuildSearch> {
  Function filtrarNoticias;
  TextEditingController editingController = TextEditingController();

  BuildSearchState({this.filtrarNoticias, this.editingController});

  buildSearch() {
    return TextField(
      onChanged: (value) {
        filtrarNoticias();
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
    return buildSearch();
  }
}
