import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bmi_calculator/imc_textfield.dart';

class IMCForm extends StatelessWidget {
  const IMCForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const IMCTextField(label: 'Estatura (cm)'),
              const SizedBox(height: 40),
              const IMCTextField(label: 'Pesoc(Kg)'),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () => {}, child: const Text('Calcular')),
            ],
          ),
        ),
      ),
    );
  }
}
