import 'package:dashboard/core/utils/responsive.dart';
import 'package:dashboard/features/dashboard/models/project_card_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectCardModel project;

  const ProjectCardWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: project.gradient,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset(project.imagePath, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  project.title.replaceAll('\n', ' '),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: isMobile ? 11 : 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),

                Row(
                  children: [
                    Flexible(
                      child: Text(
                        project.tag,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text("•", style: TextStyle(color: Colors.white54, fontSize: 10)),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        'See project details',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 10,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Icon(
            Icons.edit_outlined,
            color: Colors.white,
            size: isMobile ? 16 : 18,
          ),
        ],
      ),
    );
  }
}