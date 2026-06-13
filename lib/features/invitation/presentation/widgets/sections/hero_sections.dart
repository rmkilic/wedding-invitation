import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_invidatiton/core/extensions/context_extensions.dart';
import 'package:wedding_invidatiton/core/extensions/datetime_extensions.dart';
import 'package:wedding_invidatiton/core/theme/app_theme.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/event_organization_entity.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/invitation_entity.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/pages/viewport_fade.dart';

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

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {

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
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
         
          // Dark gradient overlay
          const DecoratedBox(
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
          ),
          SafeArea(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ViewportFade(scrollController: widget.scrollController,
              child: DecorativeText(text: widget.invitation.brideName,)),
              ViewportFade(scrollController: widget.scrollController,
              child: DecorativeText(text: '&', size: 30,)),
              ViewportFade(scrollController: widget.scrollController,
              child: DecorativeText(text: widget.invitation.groomName)),
              ViewportFade(scrollController: widget.scrollController,
              child: DecorativeDivider()),
                            ViewportFade(scrollController: widget.scrollController,

                child: Text(widget.weddingOrganization?.date.invitationDate ?? '', style: TextStyle(fontSize: 20),)),
              ViewportFade(scrollController: widget.scrollController,
              
              child: Text(widget.weddingOrganization?.date.invitationDay ?? '', style: TextStyle(fontSize: 20),))
            ],
          )),
          // Scroll down indicator
          Positioned(
            bottom: 36,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
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
            ),
          ),
        ],
      ),
    );
  }
}


class DecorativeText extends StatelessWidget {
  final String text;
  final double size;
  const DecorativeText({required this.text, this.size = 82, super.key });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.greatVibes(fontSize: size),);
  }
}

class DecorativeDivider extends StatelessWidget {
  const DecorativeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth *.3
      ,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 10,
              color: AppColors.goldDark,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text('✧', style: TextStyle(fontSize: 28, color: AppColors.goldDark),)),
          Expanded( child: Divider(
              height: 10,
              color: AppColors.goldDark,
            ),)
        ],
      ),
    );
  }


}