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

class TabletDashboardLayout extends StatelessWidget {
  const TabletDashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sectionBg,
      body: Row(
        children: [
          const Sidebar(compact: true),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TopBar(),
                  const SizedBox(height: 20),
                  const HeroProjectCard(),
                  const SizedBox(height: 18),
                  const AllProjectsSection(),
                  const SizedBox(height: 18),
                  const TopCreators(),
                  const SizedBox(height: 18),
                  const PerformanceChartCard(),
                  const SizedBox(height: 18),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(child: CalendarCard()),
                      SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          children: [
                            PeopleEventCard(event: birthdayEvent),
                            SizedBox(height: 18),
                            PeopleEventCard(event: anniversaryEvent),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
