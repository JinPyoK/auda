import 'package:auda/core/constant/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyLineChart extends StatefulWidget {
  const MyLineChart({super.key});

  @override
  State<MyLineChart> createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  String dataType = 'M';

  String chartTitle() {
    if (dataType == 'M') {
      return 'Monthly';
    } else if (dataType == 'D') {
      return 'Daily';
    } else if (dataType == 'Y') {
      return 'Yearly';
    } else {
      return '';
    }
  }

  LineChartData showData() {
    if (dataType == 'M') {
      return monthData;
    } else if (dataType == 'D') {
      return dayData;
    } else if (dataType == 'Y') {
      return yearData;
    } else {
      return monthData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                chartTitle(),
                style: TextStyle(
                  color: CustomColor.mainColor,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 6),
                  child: LineChart(
                    showData(),
                    duration: const Duration(milliseconds: 400),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Transform.translate(
            offset: const Offset(10, 7),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(
                  () {
                    if (dataType == 'M') {
                      dataType = 'D';
                    } else if (dataType == 'D') {
                      dataType = 'Y';
                    } else if (dataType == 'Y') {
                      dataType = 'M';
                    }
                  },
                );
              },
              child: Container(
                width: 30.h,
                height: 30.h,
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColor.mainColor, width: 3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: FittedBox(
                    child: Text(
                  dataType,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

LineChartData get yearData => LineChartData(
      lineTouchData: lineTouchData,
      gridData: gridData,
      titlesData: titlesData('Y'),
      borderData: borderData,
      lineBarsData: [yearLineBar],
      minX: 0,
      maxX: 3,
      maxY: null,
      minY: 0,
    );

LineChartData get monthData => LineChartData(
      lineTouchData: lineTouchData,
      gridData: gridData,
      titlesData: titlesData('M'),
      borderData: borderData,
      lineBarsData: [monthLineBar],
      minX: 0,
      maxX: 11,
      maxY: null,
      minY: 0,
    );

LineChartData get dayData => LineChartData(
      lineTouchData: lineTouchData,
      gridData: gridData,
      titlesData: titlesData('D'),
      borderData: borderData,
      lineBarsData: [dayLineBar],
      minX: 0,
      maxX: 30,
      maxY: null,
      minY: 0,
    );

LineTouchData get lineTouchData => LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.white.withOpacity(0.5)),
    );

FlTitlesData titlesData(String type) {
  return FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles(type),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );
}

SideTitles leftTitles() => SideTitles(
      getTitlesWidget: leftTitleWidgets,
      showTitles: true,
      interval: 1,
      reservedSize: 40,
    );

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '1m';
      break;
    case 2:
      text = '2m';
      break;
    case 3:
      text = '3m';
      break;
    case 4:
      text = '5m';
      break;
    case 5:
      text = '6m';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.center);
}

Widget bottomTitleYear(double value, TitleMeta meta) {
  final style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12.sp,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text('2021', style: style);
      break;
    case 1:
      text = Text('2022', style: style);
      break;
    case 2:
      text = Text('2023', style: style);
      break;
    case 3:
      text = Text('2024', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

Widget bottomTitleMonth(double value, TitleMeta meta) {
  final style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 10.sp,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text('1', style: style);
      break;
    case 1:
      text = Text('2', style: style);
      break;
    case 2:
      text = Text('3', style: style);
      break;
    case 3:
      text = Text('4', style: style);
      break;
    case 4:
      text = Text('5', style: style);
      break;
    case 5:
      text = Text('6', style: style);
      break;
    case 6:
      text = Text('7', style: style);
      break;
    case 7:
      text = Text('8', style: style);
      break;
    case 8:
      text = Text('9', style: style);
      break;
    case 9:
      text = Text('10', style: style);
      break;
    case 10:
      text = Text('11', style: style);
      break;
    case 11:
      text = Text('12', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

Widget bottomTitleDay(double value, TitleMeta meta) {
  final style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 10.sp,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text('1', style: style);
      break;
    case 4:
      text = Text('5', style: style);
      break;
    case 9:
      text = Text('10', style: style);
      break;
    case 14:
      text = Text('15', style: style);
      break;
    case 19:
      text = Text('20', style: style);
      break;
    case 24:
      text = Text('25', style: style);
      break;
    case 29:
      text = Text('30', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

SideTitles bottomTitles(String type) {
  late Widget Function(double, TitleMeta) bottomtitle;

  if (type == 'M') {
    bottomtitle = bottomTitleMonth;
  } else if (type == 'D') {
    bottomtitle = bottomTitleDay;
  } else if (type == 'Y') {
    bottomtitle = bottomTitleYear;
  }

  return SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomtitle,
  );
}

FlGridData get gridData => const FlGridData(show: false);

FlBorderData get borderData => FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(color: CustomColor.mainColor, width: 3),
        left: BorderSide(color: Colors.transparent),
        right: BorderSide(color: Colors.transparent),
        top: BorderSide(color: Colors.transparent),
      ),
    );

LineChartBarData get yearLineBar => LineChartBarData(
      isCurved: true,
      color: CustomColor.mainColor.withOpacity(0.8),
      barWidth: 6,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color: CustomColor.mainColor.withOpacity(0.2),
      ),
      spots: const [
        FlSpot(0, 1.6),
        FlSpot(1, 1),
        FlSpot(2, 2.3),
        FlSpot(3, 3.4),
      ],
    );

LineChartBarData get monthLineBar => LineChartBarData(
      isCurved: true,
      color: CustomColor.mainColor.withOpacity(0.8),
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color: CustomColor.mainColor.withOpacity(0.2),
      ),
      spots: const [
        FlSpot(0, 1),
        FlSpot(1, 2.8),
        FlSpot(2, 1.2),
        FlSpot(3, 2.5),
        FlSpot(4, 2.3),
        FlSpot(5, 3.1),
        FlSpot(6, 4.9),
        FlSpot(7, 3.3),
        FlSpot(8, 2.9),
        FlSpot(9, 1.9),
        FlSpot(10, 3.9),
        FlSpot(11, 6.1),
      ],
    );

LineChartBarData get dayLineBar => LineChartBarData(
      isCurved: true,
      color: CustomColor.mainColor.withOpacity(0.8),
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color: CustomColor.mainColor.withOpacity(0.2),
      ),
      spots: const [
        FlSpot(0, 1),
        FlSpot(1, 2.8),
        FlSpot(2, 1.2),
        FlSpot(3, 2.8),
        FlSpot(4, 2.6),
        FlSpot(5, 3.9),
        FlSpot(6, 2),
        FlSpot(7, 2.4),
        FlSpot(8, 1.5),
        FlSpot(9, 2.6),
        FlSpot(10, 2.7),
        FlSpot(11, 3.8),
        FlSpot(12, 1),
        FlSpot(13, 3),
        FlSpot(14, 4),
        FlSpot(15, 1.8),
        FlSpot(16, 2.6),
        FlSpot(17, 6.9),
        FlSpot(18, 3),
        FlSpot(19, 4.8),
        FlSpot(20, 1.5),
        FlSpot(21, 2.6),
        FlSpot(22, 2.1),
        FlSpot(23, 3),
        FlSpot(24, 2),
        FlSpot(25, 2.3),
        FlSpot(26, 1),
        FlSpot(27, 2),
        FlSpot(28, 1.6),
        FlSpot(29, 2.9),
        FlSpot(30, 1),
        FlSpot(31, 3.8),
      ],
    );
