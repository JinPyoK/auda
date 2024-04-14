import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBarChart extends StatefulWidget {
  const MyBarChart({super.key});

  @override
  State<MyBarChart> createState() => _MyBarChartState();
}

class _MyBarChartState extends State<MyBarChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff31415E),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 260.w,
                  height: 120.h,
                  child: BarChart(
                    BarChartData(
                      maxY: 100,
                      titlesData: const FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: bottomTitles,
                            reservedSize: 42,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 28,
                            interval: 1,
                            getTitlesWidget: leftTitles,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      gridData: const FlGridData(
                        show: true,
                      ),
                      backgroundColor: const Color(0xff31415E),
                      barGroups: renderBarGroups(
                          <double>[1, 1, 61.1, 57.3, 38.1, 39.1, 3.1, 2.1]),
                    ),
                    swapAnimationDuration: const Duration(milliseconds: 400),
                    // Optional
                    swapAnimationCurve: Curves.easeOutSine, // Optional
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        renderLegend(),
      ],
    );
  }
}

renderBarGroups(List<double> percent) {
  return <BarChartGroupData>[
    renderBarChartGroupData(0, percent[0], percent[1]),
    renderBarChartGroupData(1, percent[2], percent[3]),
    renderBarChartGroupData(2, percent[4], percent[5]),
    renderBarChartGroupData(3, percent[6], percent[7]),
  ];
}

renderBarChartGroupData(int x, double manY, double womanY) {
  return BarChartGroupData(
    x: x,
    barsSpace: 10,
    barRods: <BarChartRodData>[
      BarChartRodData(toY: manY, width: 12, color: Colors.lightBlueAccent),
      BarChartRodData(toY: womanY, width: 12, color: Colors.redAccent),
    ],
  );
}

Widget leftTitles(double value, TitleMeta meta) {
  final style = TextStyle(
    color: Colors.white.withOpacity(0.8),
    fontWeight: FontWeight.bold,
    fontSize: 8.sp,
  );
  String text;
  if (value == 0) {
    text = '0';
  } else if (value == 30) {
    text = '30%';
  } else if (value == 60) {
    text = '60%';
  } else if (value == 90) {
    text = '90%';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}

Widget bottomTitles(double value, TitleMeta meta) {
  final titles = <String>['0~19', '20~39', '40~59', '60~'];

  final Widget text = Text(
    titles[value.toInt()],
    style: TextStyle(
      color: Colors.white.withOpacity(0.8),
      fontWeight: FontWeight.bold,
      fontSize: 10.sp,
    ),
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16, //margin top
    child: text,
  );
}

Widget renderLegend() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(26),
        ),
      ),
      const Text(' 남자'),
      const SizedBox(
        width: 10,
      ),
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(26),
        ),
      ),
      const Text(' 여자'),
      const SizedBox(
        width: 10,
      ),
      const Text('/ 연령별'),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}
