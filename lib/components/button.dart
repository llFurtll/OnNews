import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  static ButtonBuild() {
    return FloatingActionButton(
      onPressed: () {
        print("Atualizar Lista");
      },
      tooltip: "Atualizar Lista",
      child: Icon(Icons.refresh),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBuild();
  }
}