import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screens/dashboard/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ByteBank"),
        ),
        body: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: SaldoCard(),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioDeposito(),
                ),
              ),
              child: Text("Receber depósito"),
            ),
          ],
        ));
  }
}
