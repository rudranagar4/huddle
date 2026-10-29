import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MatchScoreBadge extends StatelessWidget {
  final int score;
  final bool isLarge;

  const MatchScoreBadge({
    super.key,
    required this.score,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    Color badgeColor = AppColors.tealAccent;
    if (score < 75) {
      badgeColor = AppColors.amber;
    } else if (score < 60) {
      badgeColor = AppColors.coral;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isLarge ? 12 : 8,
        vertical: isLarge ? 6 : 4,
      ),
      decoration: BoxDecoration(
        color: badgeColor.withAlpha(28),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: badgeColor.withAlpha(90), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.bolt_rounded,
            size: isLarge ? 16 : 13,
            color: badgeColor,
          ),
          const SizedBox(width: 3),
          Text(
            '$score% MATCH',
            style: TextStyle(
              color: badgeColor,
              fontWeight: FontWeight.w800,
              fontSize: isLarge ? 13 : 11,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
