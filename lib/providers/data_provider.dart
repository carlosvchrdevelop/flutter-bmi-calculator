import 'dart:math';

import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  double _imc = 0.0;
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  double _getAltura() {
    return double.parse(_alturaController.text);
  }

  double _getPeso() {
    return double.parse(_pesoController.text);
  }

  double getIMC() {
    return _imc;
  }

  TextEditingController getAlturaController() {
    return _alturaController;
  }

  TextEditingController getPesoController() {
    return _pesoController;
  }

  void calculateIMC() {
    final double altura = _getAltura();
    final double peso = _getPeso();
    _imc = (altura > 0 && peso > 0) ? (peso / pow((altura / 100), 2)) : 0;
    notifyListeners();
  }
}
