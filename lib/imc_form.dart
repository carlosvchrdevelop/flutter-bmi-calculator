import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/imc_textfield.dart';
import 'package:flutter_bmi_calculator/providers/data_provider.dart';
import 'package:provider/provider.dart';

class IMCForm extends StatelessWidget {
  const IMCForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: Column(
            children: [
              const SizedBox(height: 50),
              IMCTextField(
                  label: 'Estatura (cm)',
                  controller: dataProvider.getAlturaController()),
              const SizedBox(height: 20),
              IMCTextField(
                  label: 'Peso (Kg)',
                  controller: dataProvider.getPesoController()),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => {dataProvider.calculateIMC()},
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Calcular',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
