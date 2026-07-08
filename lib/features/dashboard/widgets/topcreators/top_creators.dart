import 'package:dashboard/core/theme/app_colors.dart';
import 'package:dashboard/features/dashboard/data/creator_data.dart';
import 'package:dashboard/features/dashboard/widgets/topcreators/creator_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopCreators extends StatelessWidget {
  const TopCreators({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 275,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Creators',
            style: GoogleFonts.poppins(
              color: AppColors.textLightPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          // Header Row
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Name',
                    style: GoogleFonts.poppins(
                      color: AppColors.textLightSecondary,
                      fontSize: 11,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    'Artworks',
                    style: GoogleFonts.poppins(
                      color: AppColors.textLightSecondary,
                      fontSize: 11,
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    'Rating',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.poppins(
                      color: AppColors.textLightSecondary,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white10),
          for (final c in creators) CreatorRow(creator: c),
        ],
      ),
    );
  }
}
