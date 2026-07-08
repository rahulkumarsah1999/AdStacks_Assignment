import 'package:dashboard/core/theme/app_colors.dart';
import 'package:dashboard/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatelessWidget {
  final VoidCallback? onMenuTap;
  const TopBar({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Row(
      children: [
        if (onMenuTap != null)
          IconButton(
            onPressed: onMenuTap,
            icon: Icon(Icons.menu_rounded, color: AppColors.textDarkPrimary),
          ),
        if (!isMobile)
          Text(
            'Home',
            style: GoogleFonts.poppins(
              color: AppColors.textDarkPrimary,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 46,
                width: 300,
                padding: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  color: AppColors.cardDark,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: 'Search',
                          hintStyle: GoogleFonts.poppins(
                            color: AppColors.textLightSecondary,
                            fontSize: 13,
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Container(
                      height: 46,
                      width: 46,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.15),
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(14),
                        ),
                      ),
                      child: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 80),

              _TopBarIcon(icon: Icons.sticky_note_2_outlined, onTap: () {}),
              const SizedBox(width: 20),
              _TopBarIcon(
                icon: Icons.notifications_none_rounded,
                onTap: () {},
                showBadge: true,
              ),
              if (!isMobile) ...[
                const SizedBox(width: 20),
                _TopBarIcon(
                  icon: Icons.power_settings_new_rounded,
                  onTap: () {},
                ),
              ],
              const SizedBox(width: 50),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/maddison.png'),
                  ),
                  Positioned(
                    bottom: -2,
                    right: -2,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Text('🎩', style: TextStyle(fontSize: 10)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TopBarIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool showBadge;
  const _TopBarIcon({required this.icon, this.onTap, this.showBadge = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 24,
          height: 24,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(icon, color: AppColors.textDarkPrimary, size: 22),
              if (showBadge)
                Positioned(
                  top: -1,
                  right: -1,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
