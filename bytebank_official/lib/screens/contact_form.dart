import 'dart:ffi';

import 'package:bytebank_official/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New contact"),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          16,
        ),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Full name",
              ),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8,
              ),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: "Account number",
                ),
                style: TextStyle(
                  fontSize: 24,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumber =
                        int.tryParse(_accountNumberController.text) ?? 0;

                    final contact = Contact(name, accountNumber);

                    Navigator.pop(context, contact);
                  },
                  child: Text("Create"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
