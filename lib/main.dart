import 'package:automa/widget/navigation_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Automa',
        home: Scaffold(
          drawer: NavigationDrawer(),
          appBar: AppBar(
            title: Text('Automa'),
            backgroundColor: Color.fromRGBO(35, 35, 35, 1),
          ),
          body: Center(
            child: Text('hello'),
          ),
        ));
  }
}
