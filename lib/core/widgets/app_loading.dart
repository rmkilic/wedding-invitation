import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wedding_invidatiton/core/gen/assets.gen.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animations/an_groom.json'
       // Assets.animations.anWeddingRing.path,
      ),
    );
  }
}