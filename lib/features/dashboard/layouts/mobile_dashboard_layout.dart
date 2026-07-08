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

class MobileDashboardLayout extends StatelessWidget {
  const MobileDashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sectionBg,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Builder(
          builder: (innerContext) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TopBar(
                  onMenuTap: () {
                    Scaffold.of(innerContext).openDrawer();
                  },
                ),
              ),
            );
          },
        ),
      ),

      drawer: Drawer(
        backgroundColor: AppColors.sidebarBg,
        child: const Sidebar(),
      ),

      // SingleChildScrollView sirf body ke content ke liye
      body: SingleChildScrollView(
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
    );
  }
}