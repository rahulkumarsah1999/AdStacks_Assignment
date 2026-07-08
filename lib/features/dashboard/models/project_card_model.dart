import 'package:flutter/material.dart';

class ProjectCardModel {
  final String title;
  final String tag;
  final bool isSelected;
  final Gradient gradient;
  final String imagePath;

  const ProjectCardModel({
    required this.title,
    required this.tag,
    this.isSelected = false,
    required this.gradient,
    required this.imagePath,
  });
}
