import 'package:dashboard/core/theme/app_colors.dart';
import 'package:dashboard/features/dashboard/data/calendar_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(Icons.calendar_month_outlined, color: AppColors.textLightSecondary, size: 16),
          ],
        ),
        const SizedBox(height: 8),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16), // Slightly smaller radius
          ),
          child: Column(
            children: [
              Row(
                children: [
                  _DropdownPill(label: dashboardCalendar.month),
                  const SizedBox(width: 4),
                  _DropdownPill(label: dashboardCalendar.year.toString()),
                ],
              ),
              const SizedBox(height: 4),

              Row(
                children: [
                  for (final day in dashboardCalendar.weekdays)
                    Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: GoogleFonts.poppins(
                            color: AppColors.textDarkSecondary,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),

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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Padding reduced
      decoration: BoxDecoration(
        color: AppColors.cardDarkAlt.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: AppColors.textDarkPrimary,
              fontSize: 10, // Font size reduced
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 2),
          Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textDarkSecondary, size: 12),
        ],
      ),
    );
  }
}