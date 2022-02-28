import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/create_note.dart';
import 'package:notes/screens/update_note.dart';
import 'package:notes/urls.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Client client = http.Client();
  List<Note> notes = [];

  @override
  void initState() {
    _retrieveNotes();
    super.initState();
  }

  // ignore: unused_element
  void _addnote() {}

  _retrieveNotes() async {
    notes = [];
    // ignore: unused_local_variable
    List response = json.decode((await client.get(retrieveUrl)).body);
    for (var element in response) {
      notes.add(Note.fromMap(element));
    }
    setState(() {});
  }

  void _deleteNote(int id) {
    client.delete(deleteUrl(id));
    _retrieveNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            _retrieveNotes();
          },
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.grey[9],
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white30, width: 9),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ListTile(
                    title: Text('Note - ' + notes[index].id.toString()),
                    subtitle: Text(notes[index].note),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UpdateNote(
                                client: client,
                                note: notes[index].note,
                                id: notes[index].id,
                              )));
                    },
                    trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteNote(notes[index].id);
                        }),
                  ),
                ),
              );
            },
          )),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(highlightColor: Colors.orange),
        child: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreatePage(
                    client: client,
                  ))),
          child: const Icon(Icons.add),
          tooltip: 'Add Note',
        ),
      ),
    );
  }
}
