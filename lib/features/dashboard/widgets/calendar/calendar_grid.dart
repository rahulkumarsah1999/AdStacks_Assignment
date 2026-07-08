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
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: daysInMonth,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 0.5,
        crossAxisSpacing: 0.5,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final day = index + 1;
        final isHighlighted = highlightedDays.contains(day);

        return Container(
          decoration: BoxDecoration(
            color: isHighlighted ? AppColors.purple : Colors.transparent,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '$day',
            style: GoogleFonts.poppins(
              color: isHighlighted ? Colors.white : AppColors.textDarkSecondary,
              fontSize: 10,
              fontWeight: isHighlighted ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        );
      },
    );
  }
}