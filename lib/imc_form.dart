import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Estatura (cm)',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Peso (Kg)',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
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
