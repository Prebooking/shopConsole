import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StaticTable extends StatelessWidget {
  const StaticTable({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          final fontSize = isWide ? 10.0 : 8.0;
          final padding = isWide ? 16.0 : 10.0;

          return Padding(
            padding: EdgeInsets.all(padding),
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Colors.black87,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        final isRevenue = spot.barIndex == 0;
                        return LineTooltipItem(
                          isRevenue
                              ? 'Revenue : ${spot.y.toInt()}'
                              : 'Sales : ${spot.y.toInt()}%',
                          TextStyle(
                            color: isRevenue
                                ? Color(0xff074762)
                                : Color(0xffF86624),
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                          ),
                        );
                      }).toList();
                    },
                  ),
                  handleBuiltInTouches: true,
                  getTouchedSpotIndicator:
                      (barData, spotIndexes) => spotIndexes.map((index) {
                    return TouchedSpotIndicatorData(
                      FlLine(color: Colors.grey, strokeWidth: 0.5),
                     FlDotData(show: true),
                    );
                  }).toList(),
                ),
                gridData: FlGridData(show: true, drawVerticalLine: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: isWide ? 32 : 24,
                      getTitlesWidget: (value, meta) => Text(
                        '\$${value.toInt()}',
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: isWide ? 32 : 24,
                      getTitlesWidget: (value, _) {
                        final labels = [
                          "Hair Cutting", "Coloring", "Dying", "Polishing", "Grooming",
                          "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
                        ];
                        if (value.toInt() < labels.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              labels[value.toInt()],
                              style: TextStyle(fontSize: fontSize),
                            ),
                          );
                        }
                        return const Text('');
                      },
                      interval: 1,
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 1300,
                lineBarsData: [
                  // Revenue line
                  LineChartBarData(
                    isCurved: true,
                    color: Color(0xff074762),
                     dotData: FlDotData(show: false),
                    barWidth: 3,
                    spots: [
                      FlSpot(0, 700),
                      FlSpot(1, 650),
                      FlSpot(2, 800),
                      FlSpot(3, 600),
                      FlSpot(4, 750),
                      FlSpot(5, 1240),
                      FlSpot(6, 860),
                      FlSpot(7, 920),
                      FlSpot(8, 1100),
                      FlSpot(9, 780),
                      FlSpot(10, 600),
                      FlSpot(11, 700),
                    ],
                  ),
                  // Sales line
                  LineChartBarData(
                    isCurved: true,
                    color: Color(0xffF86624),
                     dotData: FlDotData(show: false),
                    barWidth: 3,
                    spots: [
                      FlSpot(0, 600),
                      FlSpot(1, 550),
                      FlSpot(2, 680),
                      FlSpot(3, 850),
                      FlSpot(4, 650),
                      FlSpot(5, 30),
                      FlSpot(6, 660),
                      FlSpot(7, 640),
                      FlSpot(8, 700),
                      FlSpot(9, 750),
                      FlSpot(10, 620),
                      FlSpot(11, 800),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    
  }
}