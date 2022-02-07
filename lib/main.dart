import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/imc_chart.dart';
import 'package:flutter_bmi_calculator/imc_form.dart';
import 'package:flutter_bmi_calculator/providers/data_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DataProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calculadora IMC',
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Calculadora IMC'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [IMCForm(), IMCChart()],
            ),
          )),
    );
  }
}
