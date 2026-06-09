import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_invidatiton/core/theme/app_theme.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/event_organization_entity.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/animated_reveal.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/ornament_divider.dart';

class LocationSection extends StatelessWidget {
  final List<EventOrganizationEntity> organizations;

  const LocationSection({super.key, required this.organizations});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.warmCream,
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 24),
      child: Column(
        children: [
          AnimatedReveal(
            child: SectionHeader(title: 'Organizasyonlar'),
          ),
          const SizedBox(height: 48),
          ...organizations.asMap().entries.map(
            (entry) => AnimatedReveal(
              delay: Duration(milliseconds: entry.key * 150),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _OrganizationCard(organization: entry.value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrganizationCard extends StatelessWidget {
  final EventOrganizationEntity organization;

  const _OrganizationCard({required this.organization});

  Future<void> _openMap() async {
    final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${organization.latitude},${organization.longitude}',
    );
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.divider, width: 0.8),
        boxShadow: [
          BoxShadow(
            blurRadius: 24,
            offset: const Offset(0, 8),
            color: AppColors.charcoal.withValues(alpha: 0.06),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Card header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.divider, width: 0.8),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 3,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    organization.title.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.charcoal,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Card body
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DetailRow(
                  icon: Icons.calendar_today_outlined,
                  text: DateFormat('d MMMM yyyy, EEEE', 'tr')
                      .format(organization.date),
                ),
                const SizedBox(height: 12),
                _DetailRow(
                  icon: Icons.access_time_outlined,
                  text: DateFormat('HH:mm').format(organization.date),
                ),
                const SizedBox(height: 12),
                _DetailRow(
                  icon: Icons.location_city_outlined,
                  text: organization.hallName,
                ),
                const SizedBox(height: 12),
                _DetailRow(
                  icon: Icons.place_outlined,
                  text: organization.address,
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: _MapButton(onTap: _openMap),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _DetailRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppColors.gold),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: AppTextStyles.eventDetail),
        ),
      ],
    );
  }
}

class _MapButton extends StatefulWidget {
  final VoidCallback onTap;

  const _MapButton({required this.onTap});

  @override
  State<_MapButton> createState() => _MapButtonState();
}

class _MapButtonState extends State<_MapButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.0,
      upperBound: 0.04,
    );
    _scale = Tween<double>(begin: 1, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scale,
        builder: (context, child) =>
            Transform.scale(scale: _scale.value, child: child),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.charcoal,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.map_outlined, color: AppColors.gold, size: 16),
              SizedBox(width: 10),
              Text(
                'YOL TARİFİ AL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
