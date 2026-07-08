import 'package:dashboard/core/theme/app_colors.dart';
import 'package:dashboard/features/dashboard/data/dashboard_navigation.dart';
import 'package:dashboard/features/dashboard/data/profile_data.dart';
import 'package:dashboard/features/dashboard/models/navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nav_tile.dart';
import 'workspace_tile.dart';

class Sidebar extends StatefulWidget {
  final bool compact;
  final VoidCallback? onClose;

  const Sidebar({super.key, this.compact = false, this.onClose});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;
  bool _workspacesOpen = true;

  @override
  Widget build(BuildContext context) {
    final compact = widget.compact;

    return Container(
      width: compact ? 84 : 240,
      color: AppColors.sidebarBg,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLogo(compact),

            const SizedBox(height: 15),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(color: AppColors.divider, height: 1),
            ),

            const SizedBox(height: 15),

            _buildProfile(compact),

            const SizedBox(height: 15),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(color: AppColors.divider, height: 1),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < dashboardNavigation.length; i++)
                      NavTile(
                        data: dashboardNavigation[i],
                        selected: _selectedIndex == i,
                        compact: compact,
                        onTap: () {
                          setState(() {
                            _selectedIndex = i;
                          });

                          widget.onClose?.call();
                        },
                      ),

                    const SizedBox(height: 18),

                    if (!compact) _buildWorkspacesHeader(),

                    if (_workspacesOpen && !compact) ...[
                      const WorkspaceTile(label: 'Adstacks'),
                      const WorkspaceTile(label: 'Finance'),
                    ],
                  ],
                ),
              ),
            ),

            const Divider(height: 1, color: AppColors.divider),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: Column(
                children: [
                  NavTile(
                    data: const NavigationItem(
                      icon: Icons.settings_outlined,
                      label: 'Setting',
                      route: '/settings',
                    ),
                    selected: false,
                    compact: compact,
                    onTap: () {},
                  ),
                  NavTile(
                    data: const NavigationItem(
                      icon: Icons.logout_rounded,
                      label: 'Logout',
                      route: '/logout',
                    ),
                    selected: false,
                    compact: compact,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo(bool compact) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: compact ? 36 : 80,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _buildProfile(bool compact) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 34,
          backgroundImage: AssetImage('assets/images/maddison.png'),
        ),
        if (!compact) ...[
          const SizedBox(height: 8),
          Text(
            dashboardProfile.name,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textDarkPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.purple.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              dashboardProfile.role,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.purple,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildWorkspacesHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'WORKSPACES',
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
                color: AppColors.textDarkSecondary,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _workspacesOpen = !_workspacesOpen;
              });
            },
            child: Icon(
              _workspacesOpen ? Icons.remove_rounded : Icons.add_rounded,
              size: 18,
              color: AppColors.textDarkSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
