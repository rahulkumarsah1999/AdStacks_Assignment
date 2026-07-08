import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../models/people_event_model.dart';
import 'avatar_stack.dart';

class PeopleEventCard extends StatelessWidget {
  final PeopleEventModel event;
  const PeopleEventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('✨', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  event.title,
                  style: GoogleFonts.poppins(
                    color: AppColors.textLightPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text('✨', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),

          AvatarStack(
            count: event.avatarCount,
            avatarColor: event.avatarColor,
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Text(
                'Total',
                style: GoogleFonts.poppins(
                  color: AppColors.textLightSecondary,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 8),
              Text('|',
                  style: GoogleFonts.poppins(
                      color: AppColors.textLightSecondary, fontSize: 12)),
              const SizedBox(width: 8),
              Text(
                '${event.total}',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              Text('|',
                  style: GoogleFonts.poppins(
                      color: AppColors.textLightSecondary, fontSize: 12)),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send_rounded, size: 16),
              style: ElevatedButton.styleFrom(
                backgroundColor: event.buttonColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              label: Text(
                event.buttonLabel,
                style: GoogleFonts.poppins(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}