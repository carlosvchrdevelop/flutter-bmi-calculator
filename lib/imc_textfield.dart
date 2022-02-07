import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IMCTextField extends StatelessWidget {
  final String label;
  const IMCTextField({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 24),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'([0-9]+\.?[0-9]*|\.[0-9]+)'))
      ],
    );
  }
}
