import "package:flutter/material.dart";

class AppBarComponent extends StatelessWidget {
  static AppBarBuild(BuildContext context) {
    return AppBar(
      title: Text("On News"),
      centerTitle: true,
      backgroundColor: Theme.of(context).accentColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarBuild(context);
  }
}
