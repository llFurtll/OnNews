import "package:flutter/material.dart";

class AppBarComponent extends StatelessWidget {
  GlobalKey<ScaffoldState> key = GlobalKey();

  AppBarComponent({this.key});

  appBarBuild(BuildContext context) {
    return AppBar(
      title: Text("On News"),
      centerTitle: true,
      backgroundColor: Theme.of(context).accentColor,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          if (this.key.currentState.isDrawerOpen == false) {
            this.key.currentState.openDrawer();
          } else {
            this.key.currentState.openEndDrawer();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return appBarBuild(context);
  }
}
