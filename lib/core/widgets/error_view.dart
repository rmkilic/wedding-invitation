import 'package:flutter/material.dart';
import 'package:wedding_invidatiton/core/extensions/context_extensions.dart';
import 'package:wedding_invidatiton/core/theme/app_colors.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({required this.message,super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: AppColors.deepRose, size: 48),
            const SizedBox(height: 20),
            Text(
              message,
              style:  context.textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}