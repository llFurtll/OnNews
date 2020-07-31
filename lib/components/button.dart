import 'package:flutter/material.dart';

class ButtonComponent extends StatefulWidget {
  ScrollController scroll;

  ButtonComponent({this.scroll});

  @override
  ButtonComponentState createState() => ButtonComponentState(scroll: scroll);
}

class ButtonComponentState extends State<ButtonComponent> {
  ScrollController scroll;

  ButtonComponentState({this.scroll});

  backPositionListTop() {
    return scroll.animateTo(0.0,
        duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
  }

  buildButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        backPositionListTop();
      },
      child: Icon(
        Icons.arrow_upward,
        color: Colors.white,
      ),
      backgroundColor: Theme.of(context).accentColor,
      tooltip: "Voltar ao topo da Lista",
    );
  }

  showButton(BuildContext context) {
    return buildButton(context);
  }

  @override
  Widget build(BuildContext context) {
    return showButton(context);
  }
}
