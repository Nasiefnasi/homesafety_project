import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  final List<double> data; // List of data values for the pie chart

  MyPieChart(this.data);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
          sections: getSections(),
          centerSpaceRadius:
              40, // Adjust the size of the center hole (if needed)
        ),
      ),
    );
  }

  List<PieChartSectionData> getSections() {
    List<PieChartSectionData> sections = [];
    for (int i = 0; i < data.length; i++) {
      sections.add(
        PieChartSectionData(
          value: data[i],
          title: '${data[i]}%',
          color: Colors.primaries[i % Colors.primaries.length],
          radius: 80, // Adjust the size of the pie chart (if needed)
        ),
      );
    }
    return sections;
  }
}
