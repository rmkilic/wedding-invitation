import 'package:flutter/material.dart';
import 'package:wedding_invidatiton/core/extensions/context_extensions.dart';

class DecorativeText extends StatelessWidget {
  final String text;
  final double size;
  const DecorativeText({required this.text, this.size = 82, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.displayLarge?.copyWith(fontSize: size),
    );
  }
}
