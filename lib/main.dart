import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/page_selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('');
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
        home: const PageSelector());
  }
}
