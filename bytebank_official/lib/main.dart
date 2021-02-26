import 'package:bytebank_official/database/app_database.dart';
import 'package:bytebank_official/models/contact.dart';
import 'package:bytebank_official/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
  // This widget is the root of your application.
}
