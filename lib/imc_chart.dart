import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/providers/data_provider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class IMCChart extends StatelessWidget {
  const IMCChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    double getIMCChartArrowAngle(double imc) {
      const double minIMC = 15.0;
      const double maxIMC = 45.0;

      imc = (imc < minIMC)
          ? minIMC
          : (imc > maxIMC)
              ? maxIMC
              : imc;

      final double percentaje = (imc - minIMC) / (maxIMC - minIMC);

      return -(percentaje * pi - pi / 2);
    }

    const List<Color> colorListChart = [
      Color.fromRGBO(255, 255, 255, 0),
      Color.fromRGBO(227, 66, 136, 76),
      Color.fromRGBO(252, 124, 64, 1),
      Color.fromRGBO(254, 151, 65, 1),
      Color.fromRGBO(255, 216, 80, 1),
      Color.fromRGBO(191, 223, 89, 1),
      Color.fromRGBO(72, 220, 224, 1),
    ];
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
      'Obesidad media (35.0 - 39.9)': 6.5,
      'Obesidad mórbida (>40.0)': 3.5,
    };

    return Center(
        child: Container(
      transform: Matrix4.translationValues(
          0.0, -((MediaQuery.of(context).size.width / 4.4) - 50), 0.0),
      child: Column(
        children: [
          Stack(children: [
            PieChart(
              // Chart
              dataMap: chartData,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 20,
              chartRadius: MediaQuery.of(context).size.width / 2.2,
              colorList: colorListChart,
              initialAngleInDegree: 180,
              chartType: ChartType.ring,
              ringStrokeWidth: 50,
              centerText: dataProvider.getIMC().toStringAsFixed(1),
              legendOptions: const LegendOptions(showLegends: false),
              chartValuesOptions: const ChartValuesOptions(
                  chartValueStyle: TextStyle(fontSize: 30, color: Colors.grey),
                  showChartValueBackground: false,
                  showChartValues: false),
            ),
            Center(
              child: Transform.rotate(
                angle: getIMCChartArrowAngle(dataProvider.getIMC()),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: MediaQuery.of(context).size.width / 2.2,
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 50,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          ]),
          PieChart(
            // Legend
            dataMap: chartData,
            chartLegendSpacing: 10,
            chartRadius: 0,
            colorList: colorList,
            ringStrokeWidth: 0,
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
              showChartValues: false,
            ),
          ),
        ],
      ),
    ));
  }
}
