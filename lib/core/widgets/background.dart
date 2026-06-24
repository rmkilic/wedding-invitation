import 'package:flutter/cupertino.dart';
import 'package:wedding_invidatiton/core/gen/assets.gen.dart';

class Background extends StatelessWidget {
  const Background({required this.child, super.key });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Opacity(
          opacity: .6,
          child: Assets.images.bgInvitation.image(
            fit: BoxFit.cover
          ),
        )),
       child 
      ],
    );
  }
}