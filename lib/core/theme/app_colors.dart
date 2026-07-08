import 'package:flutter/material.dart';

class AppColors {

  static const Color pageBg = Color(0xFF0E0F22);
  static const Color sidebarBg = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1A1C39);
  static const Color cardDarkAlt = Color(0xFF1F2142);
  static const Color sectionBg = Color(0xBDC3C3C6);
  static const Color divider = Color(0xFFE9E9F2);

  static const Color textDarkPrimary = Color(0xFF1C1D2E);
  static const Color textDarkSecondary = Color(0xFF8B8C9E);
  static const Color textLightPrimary = Color(0xFFF5F5FA);
  static const Color textLightSecondary = Color(0xFFA6A7C0);

  static const Color purple = Color(0xFF7B61FF);
  static const Color purpleDeep = Color(0xFF3B3DF5);
  static const Color pink = Color(0xFFE9436B);
  static const Color pinkDeep = Color(0xFFC42655);
  static const Color logoRed = Color(0xFFE84545);
  
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors:[Color(0xFF8B5CF6), Color(0xFF6D3DF0), Color(0xFF4A2AC7)],
  );

  static const LinearGradient pinkCardGradient = LinearGradient(
    begin: AlignmentGeometry.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFEE5B7A),Color(0xFFC42D5A)],
  );

  static const LinearGradient navyCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF23264A), Color(0xFF181A33)],
  );

  static BoxShadow softShadow = BoxShadow(
    color: Colors.black.withValues(alpha: 0.25),
    blurRadius: 24,
    offset: const Offset(0, 10),
  );
}