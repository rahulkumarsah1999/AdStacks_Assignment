import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/calendar_data.dart';
import 'calendar_grid.dart';

class CalendarCard extends StatelessWidget {
  const CalendarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                dashboardCalendar.title,
                style: GoogleFonts.poppins(
                  color: AppColors.textLightPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.calendar_month_outlined,
              color: AppColors.textLightSecondary,
              size: 18,
            ),
          ],
        ),
        const SizedBox(height: 14),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _DropdownPill(label: dashboardCalendar.month),
                  const SizedBox(width: 8),
                  _DropdownPill(label: dashboardCalendar.year.toString()),
                ],
              ),
              const SizedBox(height: 14),

              Row(
                children: [
                  for (final day in dashboardCalendar.weekdays)
                    Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: GoogleFonts.poppins(
                            color: AppColors.textDarkSecondary,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),

              CalendarGrid(
                daysInMonth: dashboardCalendar.daysInMonth,
                highlightedDays: dashboardCalendar.highlightedDays,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DropdownPill extends StatelessWidget {
  final String label;
  const _DropdownPill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.cardDarkAlt.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: AppColors.textDarkPrimary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          Icon(Icons.keyboard_arrow_down_rounded,
              color: AppColors.textDarkSecondary, size: 14),
        ],
      ),
    );
  }
}