import 'package:auda/presentation/my/widget/charts/my_bar_chart.dart';
import 'package:auda/presentation/my/widget/charts/my_line_chart.dart';
import 'package:flutter/material.dart';

class MyStatistics extends StatelessWidget {
  const MyStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyLineChart(),
        MyBarChart(),
      ],
    );
  }
}
