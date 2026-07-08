import 'package:dashboard/core/theme/app_colors.dart';
import 'package:dashboard/features/dashboard/data/project_cards_data.dart';
import 'package:dashboard/features/dashboard/widgets/projects/project_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProjectsSection extends StatelessWidget {
  const AllProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0xFF16235A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Projects',
                style: GoogleFonts.poppins(
                  color: AppColors.textLightPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              for (int i = 0; i < projectCards.length; i++) ...[
                ProjectCardWidget(
                  project: projectCards[i],
                ),
                if (i != projectCards.length - 1)
                  const SizedBox(height: 5),
              ],
            ],
          ),
        ),
      ],
    );
  }
}