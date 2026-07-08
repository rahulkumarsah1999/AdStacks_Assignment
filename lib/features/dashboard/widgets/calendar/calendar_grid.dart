import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class CalendarGrid extends StatelessWidget {
  final int daysInMonth;
  final List<int> highlightedDays;

  const CalendarGrid({
    super.key,
    required this.daysInMonth,
    required this.highlightedDays,
  });

  @override
  Widget build(BuildContext context) {
    final cells = <Widget>[];

    for (int day = 1; day <= daysInMonth; day++) {
      final isHighlighted = highlightedDays.contains(day);

      cells.add(
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isHighlighted ? AppColors.purple : Colors.transparent,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '$day',
              style: GoogleFonts.poppins(
                color: isHighlighted
                    ? Colors.white
                    : AppColors.textDarkSecondary,
                fontSize: 11,
                fontWeight: isHighlighted ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: cells,
    );
  }
}