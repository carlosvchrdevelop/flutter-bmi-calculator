import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IMCChart extends StatelessWidget {
  const IMCChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(
          x: 'Insuficiencia',
          y: 5,
          color: const Color.fromRGBO(72, 220, 224, 1)),
      ChartData(
          x: 'Normal', y: 5, color: const Color.fromRGBO(191, 223, 89, 1)),
      ChartData(
          x: 'Sobrepeso', y: 5, color: const Color.fromRGBO(255, 216, 80, 1)),
      ChartData(
          x: 'Obesidad grado I',
          y: 5,
          color: const Color.fromRGBO(254, 151, 65, 1)),
      ChartData(
          x: 'Obesidad grado II',
          y: 5,
          color: const Color.fromRGBO(252, 124, 64, 1)),
      ChartData(
          x: 'Obesidad grado III',
          y: 5,
          color: const Color.fromRGBO(227, 66, 136, 76))
    ];
    return Center(
        child: SfCircularChart(
            legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap,
                offset: const Offset(0, 0),
                height: "40%"),
            annotations: [
          CircularChartAnnotation(
              widget: const Text('0.0',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25)))
        ],
            series: <CircularSeries>[
          DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              startAngle: 250, // Starting angle of doughnut
              endAngle: 110 // Ending angle of doughnut
              )
        ]));
  }
}

class ChartData {
  ChartData({required this.x, required this.y, required this.color});
  final String x;
  final double y;
  final Color color;
}
