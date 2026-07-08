import 'package:dashboard/features/dashboard/data/people_events_data.dart';
import 'package:dashboard/features/dashboard/widgets/topbar/top_bar.dart';
import 'package:dashboard/features/dashboard/widgets/topcreators/top_creators.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/calendar/calendar_card.dart';
import '../widgets/events/people_event_card.dart';
import '../widgets/hero/hero_project_card.dart';
import '../widgets/performance/performance_chart_card.dart';
import '../widgets/projects/all_projects_section.dart';
import '../widgets/sidebar/sidebar.dart';

class DesktopDashboardLayout extends StatelessWidget {
  const DesktopDashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sectionBg,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: const TopBar(),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 12, 24),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const HeroProjectCard(),
                                const SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: AllProjectsSection(),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(flex: 2, child: TopCreators()),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const PerformanceChartCard(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Container(
                          color: AppColors.cardDarkAlt,
                          padding: const EdgeInsets.fromLTRB(12, 24, 24, 24),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CalendarCard(),
                                const SizedBox(height: 18),
                                PeopleEventCard(event: birthdayEvent),
                                const SizedBox(height: 18),
                                PeopleEventCard(event: anniversaryEvent),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
