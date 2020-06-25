import "package:flutter/material.dart";

class AppBarComponent extends StatelessWidget {
  static AppBarBuild() {
    return AppBar(
      title: Text("On News"),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarBuild();
  }
}