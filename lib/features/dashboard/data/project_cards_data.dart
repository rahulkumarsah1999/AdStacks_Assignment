import 'package:dashboard/core/theme/app_colors.dart';
import 'package:dashboard/features/dashboard/models/project_card_model.dart';

const List<ProjectCardModel> projectCards = [
  ProjectCardModel(
    imagePath: 'assets/images/logo.png',
    title: 'Technology behind\nthe Blockchain',
    tag: 'Project #1',
    isSelected: true,
    gradient: AppColors.pinkCardGradient,
  ),
  ProjectCardModel(
    imagePath: 'assets/images/logo.png',
    title: 'Technology behind\nthe Blockchain',
    tag: 'Project #1',
    isSelected: false,
    gradient: AppColors.navyCardGradient,
  ),
  ProjectCardModel(
    imagePath: 'assets/images/logo.png',
    title: 'Technology behind\nthe Blockchain',
    tag: 'Project #1',
    isSelected: false,
    gradient: AppColors.navyCardGradient,
  ),
];