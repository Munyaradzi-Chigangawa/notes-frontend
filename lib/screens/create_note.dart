import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notes/urls.dart';

class CreatePage extends StatefulWidget {
  final Client client;
  const CreatePage({Key? key, required this.client}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(title: const Text("Create Page")),
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
            'Create a Note',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),

          //const SizedBox(height: 10,),

          const Text(
            'Check below',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Note", hintText: "Enter your note"),
            controller: controller,
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
                child: const Text("Create Note")),
          ),
        ]),
      )),
    );
  }
}
