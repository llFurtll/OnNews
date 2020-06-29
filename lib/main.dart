import 'package:flutter/material.dart';
import 'components/home.dart';

void main() => runApp(OnNews());

class OnNews extends StatefulWidget {
  @override
  OnNewsState createState() => OnNewsState();
}

class OnNewsState extends State<OnNews> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}