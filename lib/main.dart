import 'package:dashboard/core/theme/app_colors.dart';
import 'package:dashboard/features/dashboard/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AdStacksApp());
}

class AdStacksApp extends StatelessWidget {
  const AdStacksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AdStacks Media Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.pageBg,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.purple,
          brightness: Brightness.dark,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
