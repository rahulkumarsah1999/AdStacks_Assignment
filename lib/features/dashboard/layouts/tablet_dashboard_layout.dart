import 'package:dashboard/core/theme/app_colors.dart';
import 'package:dashboard/features/dashboard/data/people_events_data.dart';
import 'package:dashboard/features/dashboard/widgets/calendar/calendar_card.dart';
import 'package:dashboard/features/dashboard/widgets/events/people_event_card.dart';
import 'package:dashboard/features/dashboard/widgets/hero/hero_project_card.dart';
import 'package:dashboard/features/dashboard/widgets/performance/performance_chart_card.dart';
import 'package:dashboard/features/dashboard/widgets/projects/all_projects_section.dart';
import 'package:dashboard/features/dashboard/widgets/sidebar/sidebar.dart';
import 'package:dashboard/features/dashboard/widgets/topbar/top_bar.dart';
import 'package:dashboard/features/dashboard/widgets/topcreators/top_creators.dart';
import 'package:flutter/material.dart';

class TabletDashboardLayout extends StatelessWidget {
  const TabletDashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sectionBg,
      body: Row(
        children: [
          const SizedBox(width: 250, child: Sidebar()),
          Expanded(
            child: Column(
              children: [
                PreferredSize(
                  preferredSize: const Size.fromHeight(70),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TopBar(),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const HeroProjectCard(),
                        const SizedBox(height: 16),
                        const AllProjectsSection(),
                        const SizedBox(height: 16),
                        const TopCreators(),
                        const SizedBox(height: 16),
                        const PerformanceChartCard(),
                        const SizedBox(height: 16),
                        const CalendarCard(),
                        const SizedBox(height: 16),
                        const PeopleEventCard(event: birthdayEvent),
                        const SizedBox(height: 16),
                        const PeopleEventCard(event: anniversaryEvent),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}