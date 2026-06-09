import 'package:flutter/material.dart';
import 'package:wedding_invidatiton/core/theme/app_theme.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/animated_reveal.dart';

class FooterSection extends StatelessWidget {
  final String brideName;
  final String groomName;

  const FooterSection({
    super.key,
    required this.brideName,
    required this.groomName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.charcoal,
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 32),
      child: AnimatedReveal(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 20, height: 0.6, color: AppColors.goldDark),
                const SizedBox(width: 12),
                Text(
                  '♥',
                  style: TextStyle(color: AppColors.deepRose, fontSize: 14),
                ),
                const SizedBox(width: 12),
                Container(width: 20, height: 0.6, color: AppColors.goldDark),
              ],
            ),

            const SizedBox(height: 28),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTextStyles.footerName.copyWith(color: Colors.white),
                children: [
                  TextSpan(text: brideName),
                  TextSpan(
                    text: '  &  ',
                    style: AppTextStyles.footerName.copyWith(
                      color: AppColors.goldLight,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(text: groomName),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Text(
              '27 . 07 . 2026',
              style: const TextStyle(
                color: AppColors.goldLight,
                fontSize: 12,
                letterSpacing: 4.0,
                fontWeight: FontWeight.w300,
              ),
            ),

            const SizedBox(height: 32),

            Container(
              width: 40,
              height: 0.6,
              color: AppColors.goldDark.withValues(alpha: 0.4),
            ),

            const SizedBox(height: 20),

            Text(
              'Tüm sevdiklerinizle birlikte\ngelmekten onur duyarız.',
              style: const TextStyle(
                color: AppColors.mutedBrown,
                fontSize: 12,
                letterSpacing: 0.5,
                height: 1.8,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
