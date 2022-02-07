import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class IMCChart extends StatelessWidget {
  const IMCChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Color> colorList = [
      Color.fromRGBO(255, 255, 255, 0),
      Color.fromRGBO(72, 220, 224, 1),
      Color.fromRGBO(191, 223, 89, 1),
      Color.fromRGBO(255, 216, 80, 1),
      Color.fromRGBO(254, 151, 65, 1),
      Color.fromRGBO(252, 124, 64, 1),
      Color.fromRGBO(227, 66, 136, 76),
    ];
    final Map<String, double> chartData = {
      '': 30,
      'Insuficiencia (<18.5)': 5,
      'Normal (18.5 - 24.9)': 5,
      'Sobrepeso (25.0 - 29.9)': 5,
      'Obesidad leve (30.0 - 34.9)': 5,
      'Obesidad media (35.0 - 39.9)': 5,
      'Obesidad mórbida (>40.0)': 5,
    };

    return Center(
        child: Container(
      transform: Matrix4.translationValues(
          0.0, -((MediaQuery.of(context).size.width / 4.4) - 50), 0.0),
      child: PieChart(
        dataMap: chartData,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 20,
        chartRadius: MediaQuery.of(context).size.width / 2.2,
        colorList: colorList,
        initialAngleInDegree: 180,
        chartType: ChartType.ring,
        ringStrokeWidth: 50,
        centerText: "0.0",
        legendOptions: const LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.bottom,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: const ChartValuesOptions(
          chartValueStyle: TextStyle(fontSize: 30, color: Colors.grey),
          showChartValueBackground: false,
          showChartValues: false,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
      ),
    ));
  }
}
