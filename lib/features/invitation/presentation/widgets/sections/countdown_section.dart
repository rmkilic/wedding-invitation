import 'dart:async';

import 'package:flutter/material.dart';

class CountdownSection extends StatefulWidget {

  final DateTime weddingDate;

  const CountdownSection({
    super.key,
    required this.weddingDate,
  });

  @override
  State<CountdownSection> createState() =>
      _CountdownSectionState();
}

class _CountdownSectionState
    extends State<CountdownSection> {

  late Timer timer;

  Duration remaining = Duration.zero;

  @override
  void initState() {
    super.initState();

    _calculateRemainingTime();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        _calculateRemainingTime();
      },
    );
  }

  void _calculateRemainingTime() {

    final difference =
        widget.weddingDate.difference(
      DateTime.now(),
    );

    setState(() {
      remaining = difference;
    });
  }

  @override
  void dispose() {

    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final days = remaining.inDays;

    final hours =
        remaining.inHours.remainder(24);

    final minutes =
        remaining.inMinutes.remainder(60);

    final seconds =
        remaining.inSeconds.remainder(60);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 48,
        horizontal: 24,
      ),

      child: Column(
        children: [

          const Text(
            'Düğüne Kalan Süre',

            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 32),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,

            children: [

              _TimeCard(
                value: days.toString(),
                label: 'Gün',
              ),

              _TimeCard(
                value: hours.toString(),
                label: 'Saat',
              ),

              _TimeCard(
                value: minutes.toString(),
                label: 'Dakika',
              ),

              _TimeCard(
                value: seconds.toString(),
                label: 'Saniye',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimeCard extends StatelessWidget {

  final String value;
  final String label;

  const _TimeCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Text(
          value,

          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(label),
      ],
    );
  }
}