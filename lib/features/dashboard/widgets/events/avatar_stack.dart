import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AvatarStack extends StatelessWidget {
  final int count;
  final Color avatarColor;
  final List<String>? avatarImages;
  final String? badgeEmoji;

  const AvatarStack({
    super.key,
    required this.count,
    required this.avatarColor,
    this.avatarImages,
    this.badgeEmoji,
  });

  @override
  Widget build(BuildContext context) {
    final images = avatarImages ?? [
      'assets/images/karlo.png',
      'assets/images/maddison.png',
      'assets/images/logo.png',
    ];
    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          for (int i = 0; i < count; i++)
            Positioned(
              left: i * 30.0,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.cardDark,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: avatarColor,
                      backgroundImage: i < images.length
                          ? AssetImage(images[i])
                          : null,
                      child: i >= images.length
                          ? const Icon(Icons.person, color: Colors.white, size: 16)
                          : null,
                    ),
                  ),
                  if (badgeEmoji != null)
                    Positioned(
                      top: -4,
                      right: -2,
                      child: Text(badgeEmoji!,
                          style: const TextStyle(fontSize: 14)),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}