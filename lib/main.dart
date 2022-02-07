import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/imc_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculadora IMC',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Calculadora IMC'),
          ),
          body: Column(
            children: const [IMCForm()],
          ),
        ));
  }
}
