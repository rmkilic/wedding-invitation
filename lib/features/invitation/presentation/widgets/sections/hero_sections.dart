import 'package:flutter/material.dart';
import 'package:wedding_invidatiton/core/extensions/context_extensions.dart';
import 'package:wedding_invidatiton/core/extensions/datetime_extensions.dart';
import 'package:wedding_invidatiton/core/theme/app_colors.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/event_organization_entity.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/invitation_entity.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/decorative_divider.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/decorative_text.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/viewport_fade.dart';

class HeroSection extends StatefulWidget {
  final InvitationEntity invitation;
  final EventOrganizationEntity? hennaOrganization;
  final EventOrganizationEntity? weddingOrganization;
  final ScrollController scrollController;

  const HeroSection({
    super.key,
    required this.invitation,
    this.hennaOrganization,
    this.weddingOrganization,
    required this.scrollController,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>{


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [  
          const _DarkGradient(),
          SafeArea(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ViewportFade(scrollController: widget.scrollController,
                child: DecorativeText(text: widget.invitation.brideName,)),             
              ViewportFade(scrollController: widget.scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DecorativeText(text: '&', size: 30,),
                )),        
              ViewportFade(scrollController: widget.scrollController,
                child: DecorativeText(text: widget.invitation.groomName)),
              ViewportFade(scrollController: widget.scrollController, 
                child: DecorativeDivider(filled: false, )),
              ViewportFade(scrollController: widget.scrollController,
                child: Text(widget.weddingOrganization?.date.invitationDate ?? '', style: context.textTheme.titleLarge,)),
              const SizedBox(height: 5.0,),
              ViewportFade(scrollController: widget.scrollController,   
                child: Text(widget.weddingOrganization?.date.invitationDay ?? '', style: context.textTheme.titleLarge,))
            ],
          )),
          // Scroll down indicator
          Positioned(
            bottom: 36,
            left: 0,
            right: 0,
            child: _BottomAnimation() 
          ),
        ],
      ),
    );
  }
}

class _DarkGradient extends StatelessWidget {
  const _DarkGradient();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x22000000),
                  Color(0x44000000),
                  Color(0x66000000)
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          );
  }
}

class _BottomAnimation extends StatefulWidget {
  const _BottomAnimation();

  @override
  State<_BottomAnimation> createState() => __BottomAnimationState();
}

class __BottomAnimationState extends State<_BottomAnimation> with TickerProviderStateMixin {

  late final AnimationController _pulseController;
  late final Animation<double> _indicatorBounce;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
    _indicatorBounce = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
              animation: _indicatorBounce,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, _indicatorBounce.value),
                child: child,
              ),
              child: Column(
                children: [
                  Text(
                    'KAYDIRIN',
                    style: TextStyle(
                      color: AppColors.goldLight.withValues(alpha: .8),
                      fontSize: 10,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.goldLight.withValues(alpha: 0.5),
                    size: 28,
                  ),
                ],
              ),
            );
  }
}





