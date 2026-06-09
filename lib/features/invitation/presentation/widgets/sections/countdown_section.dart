import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wedding_invidatiton/core/theme/app_theme.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/animated_reveal.dart';

class CountdownSection extends StatefulWidget {
  final DateTime weddingDate;

  const CountdownSection({super.key, required this.weddingDate});

  @override
  State<CountdownSection> createState() => _CountdownSectionState();
}

class _CountdownSectionState extends State<CountdownSection> {
  late Timer _timer;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculate();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _calculate());
  }

  void _calculate() {
    final diff = widget.weddingDate.difference(DateTime.now());
    setState(() => _remaining = diff.isNegative ? Duration.zero : diff);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = _remaining.inDays;
    final hours = _remaining.inHours.remainder(24);
    final minutes = _remaining.inMinutes.remainder(60);
    final seconds = _remaining.inSeconds.remainder(60);

    return Container(
      width: double.infinity,
      color: AppColors.darkSection,
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 24),
      child: AnimatedReveal(
        child: Column(
          children: [
            // Section header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 28, height: 0.6, color: AppColors.goldDark),
                const SizedBox(width: 12),
                Text(
                  '✦',
                  style: TextStyle(color: AppColors.goldDark, fontSize: 10),
                ),
                const SizedBox(width: 12),
                Container(width: 28, height: 0.6, color: AppColors.goldDark),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'DÜĞÜNE KALAN SÜRE',
              style: const TextStyle(
                color: AppColors.goldLight,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 4.0,
              ),
            ),
            const SizedBox(height: 48),

            // Countdown cards
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CountdownCard(
                  value: days,
                  label: 'GÜN',
                  delay: const Duration(milliseconds: 0),
                ),
                _Separator(),
                _CountdownCard(
                  value: hours,
                  label: 'SAAT',
                  delay: const Duration(milliseconds: 120),
                ),
                _Separator(),
                _CountdownCard(
                  value: minutes,
                  label: 'DAKİKA',
                  delay: const Duration(milliseconds: 240),
                ),
                _Separator(),
                _CountdownCard(
                  value: seconds,
                  label: 'SANİYE',
                  delay: const Duration(milliseconds: 360),
                ),
              ],
            ),

            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 28, height: 0.6, color: AppColors.goldDark),
                const SizedBox(width: 12),
                Text(
                  '✦',
                  style: TextStyle(color: AppColors.goldDark, fontSize: 10),
                ),
                const SizedBox(width: 12),
                Container(width: 28, height: 0.6, color: AppColors.goldDark),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CountdownCard extends StatefulWidget {
  final int value;
  final String label;
  final Duration delay;

  const _CountdownCard({
    required this.value,
    required this.label,
    required this.delay,
  });

  @override
  State<_CountdownCard> createState() => _CountdownCardState();
}

class _CountdownCardState extends State<_CountdownCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entrance;
  late final Animation<double> _entranceFade;
  late final Animation<double> _entranceSlide;

  @override
  void initState() {
    super.initState();
    _entrance = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _entranceFade = CurvedAnimation(parent: _entrance, curve: Curves.easeOut);
    _entranceSlide = Tween<double>(begin: 24, end: 0).animate(
      CurvedAnimation(parent: _entrance, curve: Curves.easeOutCubic),
    );
    Future.delayed(widget.delay, () {
      if (mounted) _entrance.forward();
    });
  }

  @override
  void dispose() {
    _entrance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _entrance,
      builder: (context, child) => Opacity(
        opacity: _entranceFade.value,
        child: Transform.translate(
          offset: Offset(0, _entranceSlide.value),
          child: child,
        ),
      ),
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.goldDark.withValues(alpha: 0.3), width: 0.8),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.4),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: Text(
                widget.value.toString().padLeft(2, '0'),
                key: ValueKey(widget.value),
                style: AppTextStyles.countdownValue,
              ),
            ),
            const SizedBox(height: 8),
            Text(widget.label, style: AppTextStyles.countdownLabel),
          ],
        ),
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 6, right: 6),
      child: Text(
        ':',
        style: TextStyle(
          fontFamily: 'Georgia',
          fontSize: 32,
          color: AppColors.goldDark,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
