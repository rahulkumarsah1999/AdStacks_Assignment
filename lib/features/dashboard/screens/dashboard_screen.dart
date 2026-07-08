import 'package:flutter/material.dart';

import '../../../../core/utils/responsive.dart';
import '../layouts/desktop_dashboard_layout.dart';
import '../layouts/mobile_dashboard_layout.dart';
import '../layouts/tablet_dashboard_layout.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    switch (Responsive.deviceTypeOf(context)) {
      case DeviceType.desktop:
        return const DesktopDashboardLayout();

      case DeviceType.tablet:
        return const TabletDashboardLayout();

      case DeviceType.mobile:
        return const MobileDashboardLayout();
    }
  }
}