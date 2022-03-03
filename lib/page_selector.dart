import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes/screens/main_menu.dart';
import 'screens/on_board.dart';

class PageSelector extends StatelessWidget {
  const PageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('');

    bool firstTimeState = box.get('introduction') ?? true;
    return firstTimeState ? const OnBoard() : const MainMenu();
  }
}
