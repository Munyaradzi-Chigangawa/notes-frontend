import 'package:flutter/material.dart';
import 'package:notes/screens/main_menu.dart';
import 'package:notes/screens/on_boarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App with Django',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isviewed != 0 ? const OnBoard() : const MainMenu());
  }
}
