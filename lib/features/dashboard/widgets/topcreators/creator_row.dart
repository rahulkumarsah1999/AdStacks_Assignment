import 'package:dashboard/core/theme/app_colors.dart';
import 'package:dashboard/features/dashboard/models/creator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatorRow extends StatelessWidget {
  final Creator creator;
  const CreatorRow({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox(
              width: 28,
              height: 28,
              child: Image.asset(creator.imagePath, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              creator.handle,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: AppColors.textLightPrimary,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: Text(
              '${creator.artworks}',
              style: GoogleFonts.poppins(
                color: AppColors.textLightSecondary,
                fontSize: 9,
              ),
            ),
          ),
          SizedBox(
            width: 60,
            child: Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  width: 42,
                  height: 4,
                  child: Stack(
                    children: [
                      Container(color: Colors.white.withValues(alpha: 0.08)),
                      FractionallySizedBox(
                        widthFactor: creator.rating,
                        child: Container(color: AppColors.purple),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
