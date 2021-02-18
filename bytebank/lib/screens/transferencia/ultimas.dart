import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Últimas transferências",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _quantidade = transferencias.transferencias.length;

          if (_quantidade == 0) return SemTransferenciaCadastrada();

          final _ultimasTransferencias =
              transferencias.transferencias.reversed.toList();

          return ListView.builder(
            itemCount: _quantidade < 3 ? _quantidade : 2,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              return ItemTransferencia(_ultimasTransferencias[indice]);
            },
          );
        }),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListaTransferencia(),
            ),
          ),
          child: Text("Ver todas as transferências"),
        ),
      ],
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          "Você ainda não possui alguma transferência realizada",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
