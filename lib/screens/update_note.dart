import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notes/urls.dart';

class UpdateNote extends StatefulWidget {
  final Client client;
  final int id;
  final String note;

  const UpdateNote(
      {Key? key, required this.client, required this.id, required this.note})
      : super(key: key);

  @override
  _UpdateNoteState createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  TextEditingController controller = TextEditingController();

  @override
  initState() {
    controller.text = widget.note;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          // ignore: prefer_const_constructors
          child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 0),
        child: ListView(children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.keyboard_backspace))),
          const Text(
            'Update your Note',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Note", hintText: "Update your note"),
            controller: controller,
            maxLines: null,
          ),
          const SizedBox(
            height: 80,
          ),
          SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Theme.of(context).primaryColor)),
                onPressed: () {
                  widget.client
                      .post(createURL, body: {'body': controller.text});
                  Navigator.pop(context);
                },
                child: const Text("Update Note")),
          ),
        ]),
      )),
    );
  }
}
