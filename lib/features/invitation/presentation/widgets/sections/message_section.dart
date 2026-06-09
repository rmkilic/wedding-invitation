import 'package:flutter/material.dart';
import 'package:wedding_invidatiton/core/theme/app_theme.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/animated_reveal.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/ornament_divider.dart';

class MessageSection extends StatelessWidget {
  const MessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.warmCream,
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 40),
      child: AnimatedReveal(
        child: Column(
          children: [
            OrnamentDivider(color: AppColors.goldDark),
            const SizedBox(height: 40),

            Text(
              '“',
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 72,
                color: AppColors.goldLight,
                height: 0.6,
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Hayatımızın en güzel gününde\nsizi aramızda görmekten\nbüyük mutluluk duyacağız.',
              style: AppTextStyles.messageText,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: AppColors.gold,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.deepRose,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: AppColors.gold,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
            OrnamentDivider(color: AppColors.goldDark),
          ],
        ),
      ),
    );
  }
}
