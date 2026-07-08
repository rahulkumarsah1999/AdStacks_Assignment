import 'package:flutter/material.dart';
import '../models/navigation_item.dart';

const dashboardNavigation = [
  NavigationItem(
    icon: Icons.home_rounded,
    label: 'Home',
    route: '/home',
  ),
  NavigationItem(
    icon: Icons.groups_rounded,
    label: 'Employees',
    route: '/employees',
  ),
  NavigationItem(
    icon: Icons.fact_check_rounded,
    label: 'Attendance',
    route: '/attendance',
  ),
  NavigationItem(
    icon: Icons.bar_chart_rounded,
    label: 'Summary',
    route: '/summary',
  ),
  NavigationItem(
    icon: Icons.info_outline_rounded,
    label: 'Information',
    route: '/information',
  ),
];