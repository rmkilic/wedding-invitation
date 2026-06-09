import 'package:flutter/material.dart';
import 'package:wedding_invidatiton/core/theme/app_theme.dart';

class OrnamentDivider extends StatelessWidget {
  final Color color;
  final String symbol;
  final double lineWidth;

  const OrnamentDivider({
    super.key,
    this.color = AppColors.gold,
    this.symbol = '✦',
    this.lineWidth = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _line(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(symbol, style: TextStyle(color: color, fontSize: 12)),
        ),
        _line(),
      ],
    );
  }

  Widget _line() => Container(width: lineWidth, height: 0.8, color: color);
}

class SectionHeader extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color ornamentColor;

  const SectionHeader({
    super.key,
    required this.title,
    this.titleStyle,
    this.ornamentColor = AppColors.gold,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrnamentDivider(color: ornamentColor),
        const SizedBox(height: 20),
        Text(
          title.toUpperCase(),
          style: titleStyle ?? AppTextStyles.sectionTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        OrnamentDivider(color: ornamentColor),
      ],
    );
  }
}
