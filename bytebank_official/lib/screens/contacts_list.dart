import 'package:bytebank_official/models/contact.dart';
import 'package:bytebank_official/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                "Renato",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              subtitle: Text(
                "1000,00",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push<Contact>(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then(
                (value) => debugPrint(value.toString()),
              );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
