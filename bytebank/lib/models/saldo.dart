import 'package:flutter/cupertino.dart';

class Saldo extends ChangeNotifier {
  double _saldo;

  double get saldo => _saldo;

  Saldo(this._saldo);

  void adiciona(double saldo) {
    this._saldo += saldo;

    notifyListeners();
  }

  void subtrai(double saldo) {
    this._saldo -= saldo;

    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $_saldo';
  }
}
