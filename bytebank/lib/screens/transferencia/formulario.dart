import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _TITULO_APP_BAR = "Criando transferência";

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    final transferenciaValida = _saldoSuficiente(context, valor) &&
        _validaTransferencia(numeroConta, valor);

    if (transferenciaValida) {
      _atualizaEstado(context, Transferencia(valor, numeroConta));
      Navigator.pop(context);
    }
  }

  bool _validaTransferencia(int numeroConta, double valor) =>
      numeroConta != null && valor != null;

  bool _saldoSuficiente(BuildContext context, double valor) =>
      valor <= Provider.of<Saldo>(context, listen: false).saldo;

  void _atualizaEstado(BuildContext context, Transferencia transferencia) {
    Provider.of<Transferencias>(context, listen: false).adiciona(transferencia);
    Provider.of<Saldo>(context, listen: false).subtrai(transferencia.valor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_TITULO_APP_BAR),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }
}
