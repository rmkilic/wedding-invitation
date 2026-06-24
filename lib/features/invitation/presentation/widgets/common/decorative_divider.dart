import 'package:flutter/material.dart';
import 'package:wedding_invidatiton/core/extensions/context_extensions.dart';
import 'package:wedding_invidatiton/core/theme/app_colors.dart';

class DecorativeDivider extends StatelessWidget {
  const DecorativeDivider({this.percentWidth=.3, this.filled = true, super.key});
  final double percentWidth;
  final bool filled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * percentWidth
      ,
      child: Row(
        children: [
          Expanded(
            child: const _Divider()
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text( filled ? '✦' : '✧', style: TextStyle(fontSize: 18, color: AppColors.goldDark),)),
          Expanded( child: _Divider())
        ],
      ),
    );
  }
}


class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Divider(
              color: AppColors.goldDark,
            );
  }
}