import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashboard/core/theme/app_colors.dart';
import 'package:dashboard/features/dashboard/data/performance_chart_data.dart';
import 'package:dashboard/features/dashboard/widgets/performance/legend_dot.dart';

class PerformanceChartCard extends StatelessWidget {
  const PerformanceChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 320;

              if (isNarrow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Over All Performance',
                          style: GoogleFonts.poppins(
                            color: AppColors.textDarkPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'The Years',
                          style: GoogleFonts.poppins(
                            color: AppColors.textDarkPrimary,
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        LegendDot(color: AppColors.pink, label: 'Pending'),
                        LegendDot(color: AppColors.purple, label: 'Project Done'),
                      ],
                    ),
                  ],
                );
              }

              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Over All Performance',
                        style: GoogleFonts.poppins(
                          color: AppColors.textDarkPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'The Years',
                        style: GoogleFonts.poppins(
                          color: AppColors.textDarkPrimary,
                          fontSize: 11.5,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const LegendDot(color: AppColors.pink, label: 'Pending'),
                  const SizedBox(width: 14),
                  const LegendDot(color: AppColors.purple, label: 'Project Done'),
                ],
              );
            },
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 180,
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 60,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide(color: Color(0xFFE6E6E6), width: 1),
                    bottom: BorderSide(color: Color(0xFFE6E6E6), width: 1),
                  ),
                ),
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (_) => AppColors.purple,
                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          '${performanceChart.years[spot.x.toInt()]}\n${spot.y.toInt()}',
                          GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 10,
                      reservedSize: 30,
                      getTitlesWidget: (value, _) => Text(
                        value.toInt().toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: AppColors.textLightSecondary,
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 22,
                      getTitlesWidget: (value, _) {
                        int index = value.toInt();
                        if (index < 0 || index >= performanceChart.years.length) {
                          return const SizedBox.shrink();
                        }
                        return Text(
                          performanceChart.years[index],
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: AppColors.textLightSecondary,
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                clipData: const FlClipData.all(),
                lineBarsData: [
                  _buildLine(performanceChart.pending, AppColors.pink),
                  _buildLine(performanceChart.completed, AppColors.purple),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static LineChartBarData _buildLine(List<double> values, Color color) {
    return LineChartBarData(
      spots: List.generate(
        values.length,
        (i) => FlSpot(i.toDouble(), values[i]),
      ),
      isCurved: true,
      curveSmoothness: 0.35,
      color: color,
      barWidth: 3,
      dotData: FlDotData(show: true, checkToShowDot: (spot, barData) => false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color.withValues(alpha: 0.22),
            color.withValues(alpha: 0.02),
          ],
        ),
      ),
    );
  }
}
