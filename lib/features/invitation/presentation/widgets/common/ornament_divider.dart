import 'package:flutter/material.dart';
import 'package:wedding_invidatiton/core/theme/app_colors.dart';

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


