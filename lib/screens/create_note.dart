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
      appBar: AppBar(title: const Text("Create Page")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  labelText: "Note", hintText: "Enter your note"),
              controller: controller,
              //maxLines: 50,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  widget.client
                      .post(createURL, body: {'body': controller.text});
                  Navigator.pop(context);
                },
                child: const Text("Create Note"))
          ],
        ),
      ),
    );
  }
}
