import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_invidatiton/core/extensions/datetime_extensions.dart';
import 'package:wedding_invidatiton/core/theme/app_colors.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/animated_reveal.dart';

class FooterSection extends StatelessWidget {
  final String brideName;
  final String groomName;
  final DateTime weddingDate;

  const FooterSection({
    super.key,
    required this.brideName,
    required this.groomName,
    required this.weddingDate
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
                  style: TextStyle(color: AppColors.goldLight, fontSize: 14),
                ),
                const SizedBox(width: 12),
                Container(width: 20, height: 0.6, color: AppColors.goldDark),
              ],
            ),

            const SizedBox(height: 28),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.greatVibes(color: AppColors.goldLight, fontSize: 24),
                children: [
                  TextSpan(text: brideName),
                  TextSpan(
                    text: '  &  ',
                    style: GoogleFonts.greatVibes(color: AppColors.goldLight, fontSize: 18),

                  ),
                  TextSpan(text: groomName),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Text(
              weddingDate.invitationDate,
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
              'Tüm sevdiklerimizle \n birlikte...',
              style: TextStyle(
                color: AppColors.gold.withValues(alpha: .6),
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
