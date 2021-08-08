import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AppView();
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => "Pokemon Flutter App",
      builder: (context,child) {
        return Container(
          child: Center(
            child: Text("Hi,there"),
          ),
        );
      },
    );
  }
  
}