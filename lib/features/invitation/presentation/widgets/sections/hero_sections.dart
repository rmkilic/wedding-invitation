import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wedding_invidatiton/core/theme/app_theme.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/event_organization_entity.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/invitation_entity.dart';

class HeroSection extends StatefulWidget {
  final InvitationEntity invitation;
  final EventOrganizationEntity hennaOrganization;
  final EventOrganizationEntity weddingOrganization;
  final ScrollController scrollController;

  const HeroSection({
    super.key,
    required this.invitation,
    required this.hennaOrganization,
    required this.weddingOrganization,
    required this.scrollController,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late final AnimationController _entranceController;
  late final AnimationController _pulseController;

  late final Animation<double> _ornamentFade;
  late final Animation<double> _brideSlide;
  late final Animation<double> _brideFade;
  late final Animation<double> _groomSlide;
  late final Animation<double> _groomFade;
  late final Animation<double> _detailsFade;
  late final Animation<double> _detailsSlide;
  late final Animation<double> _indicatorBounce;

  @override
  void initState() {
    super.initState();

    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);

    _ornamentFade = CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    );

    _brideFade = CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.2, 0.55, curve: Curves.easeOut),
    );
    _brideSlide = Tween<double>(begin: 30, end: 0).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(0.2, 0.55, curve: Curves.easeOutCubic),
      ),
    );

    _groomFade = CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.35, 0.65, curve: Curves.easeOut),
    );
    _groomSlide = Tween<double>(begin: 30, end: 0).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(0.35, 0.65, curve: Curves.easeOutCubic),
      ),
    );

    _detailsFade = CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
    );
    _detailsSlide = Tween<double>(begin: 20, end: 0).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _indicatorBounce = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _entranceController.forward();
    });
  }

  @override
  void dispose() {
    _entranceController.dispose();
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
          _ParallaxBackground(
            imageUrl: widget.invitation.backgroundImageUrl,
            scrollController: widget.scrollController,
            sectionHeight: height,
          ),

          // Dark gradient overlay
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x55000000),
                  Color(0x99000000),
                  Color(0xCC000000),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: AnimatedBuilder(
                animation: _entranceController,
                builder: (context, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Top ornament line
                      Opacity(
                        opacity: _ornamentFade.value,
                        child: _TopOrnament(),
                      ),

                      const SizedBox(height: 36),

                      // Bride name
                      Opacity(
                        opacity: _brideFade.value,
                        child: Transform.translate(
                          offset: Offset(0, _brideSlide.value),
                          child: Text(
                            widget.invitation.brideName,
                            style: AppTextStyles.heroNames,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Ampersand
                      Opacity(
                        opacity: _brideFade.value,
                        child: Text('&', style: AppTextStyles.heroAmpersand),
                      ),

                      const SizedBox(height: 8),

                      // Groom name
                      Opacity(
                        opacity: _groomFade.value,
                        child: Transform.translate(
                          offset: Offset(0, _groomSlide.value),
                          child: Text(
                            widget.invitation.groomName,
                            style: AppTextStyles.heroNames,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Details
                      Opacity(
                        opacity: _detailsFade.value,
                        child: Transform.translate(
                          offset: Offset(0, _detailsSlide.value),
                          child: Column(
                            children: [
                              _GoldDividerLine(),
                              const SizedBox(height: 24),
                              Text(
                                DateFormat(
                                  'd MMMM yyyy',
                                  'tr',
                                ).format(widget.weddingOrganization.date).toUpperCase(),
                                style: AppTextStyles.heroDate,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.weddingOrganization.hallName.toUpperCase(),
                                style: AppTextStyles.heroVenue,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              _GoldDividerLine(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

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
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 10,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white.withValues(alpha: 0.5),
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

class _ParallaxBackground extends StatelessWidget {
  final String imageUrl;
  final ScrollController scrollController;
  final double sectionHeight;

  const _ParallaxBackground({
    required this.imageUrl,
    required this.scrollController,
    required this.sectionHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        final offset = scrollController.hasClients
            ? scrollController.offset.clamp(0.0, sectionHeight)
            : 0.0;
        return Transform.translate(
          offset: Offset(0, offset * 0.35),
          child: child,
        );
      },
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(color: AppColors.darkSection);
        },
        errorBuilder: (ctx, error, stack) =>
            Container(color: AppColors.darkSection),
      ),
    );
  }
}

class _TopOrnament extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 40, height: 0.6, color: AppColors.goldLight),
        const SizedBox(width: 10),
        Text(
          '✦  ✦  ✦',
          style: TextStyle(
            color: AppColors.goldLight,
            fontSize: 10,
            letterSpacing: 6,
          ),
        ),
        const SizedBox(width: 10),
        Container(width: 40, height: 0.6, color: AppColors.goldLight),
      ],
    );
  }
}

class _GoldDividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 32, height: 0.6, color: AppColors.gold),
        const SizedBox(width: 10),
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: AppColors.gold,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Container(width: 32, height: 0.6, color: AppColors.gold),
      ],
    );
  }
}
