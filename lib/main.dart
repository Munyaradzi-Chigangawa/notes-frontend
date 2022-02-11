import 'package:flutter/material.dart';
import 'package:notes/screens/main_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Notes App with Django',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainMenu());
  }
}
