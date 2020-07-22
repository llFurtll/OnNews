import 'package:flutter/material.dart';

class BuildSearch {
  static buildSearch(TextEditingController editingController, Function filtrarNoticias(String value)) {
    return TextField(
      onChanged: (value) {
        filtrarNoticias(value);
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
}
