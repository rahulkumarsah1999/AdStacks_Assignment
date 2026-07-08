import 'package:dashboard/core/theme/app_colors.dart';
import 'package:dashboard/features/dashboard/models/navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavTile extends StatelessWidget {
  final NavigationItem data;
  final bool selected;
  final bool compact;
  final VoidCallback onTap;

  const NavTile({
    super.key,
    required this.data,
    required this.selected,
    required this.compact,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.purple : AppColors.textDarkSecondary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: selected
            ? AppColors.purple.withValues(alpha: 0.10)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: compact ? 0 : 14,
            ),
            child: Row(
              mainAxisAlignment: compact
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Icon(data.icon, size: 20, color: color),
                if (!compact) ...[
                  const SizedBox(width: 8),
                  Text(
                    data.label,
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
