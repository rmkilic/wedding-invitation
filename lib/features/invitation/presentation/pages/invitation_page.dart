import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_invidatiton/core/gen/assets.gen.dart';
import 'package:wedding_invidatiton/core/theme/app_theme.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/pages/background.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/sections/countdown_section.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/sections/footer_section.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/sections/hero_sections.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/sections/location_section.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/sections/message_section.dart';

import '../bloc/invitation_bloc.dart';
import '../bloc/invitation_event.dart';
import '../bloc/invitation_state.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    context.read<InvitationBloc>().add(GetInvitationRequested());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmCream,
      extendBodyBehindAppBar: true,
      body: BlocBuilder<InvitationBloc, InvitationState>(
        builder: (context, state) {
          if (state is InvitationLoading || state is InvitationInitial) {
            return LoadingView();
          }

          if (state is InvitationError) {
            return _ErrorView(message: state.message);
          }

          if (state is InvitationLoaded) {
        
            final invitation = state.invitation;
            final hennaOrg = invitation.organizations['henna'];
            final weddingOrg = invitation.organizations['wedding'];
            
            return Background(
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: HeroSection(
                      invitation: invitation,
                      hennaOrganization: hennaOrg,
                      weddingOrganization: weddingOrg,
                      scrollController: _scrollController,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: MessageSection(message: invitation.message, brideFamily: invitation.family.bride, groomFamily: invitation.family.groom,),
                  ),
                  SliverToBoxAdapter(
                    child: CountdownSection(
                      weddingDate: weddingOrg?.date ?? DateTime.now(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: LocationSection(organizations: invitation.organizations),
                  ),
                  SliverToBoxAdapter(
                    child: FooterSection(
                      brideName: invitation.brideName,
                      groomName: invitation.groomName,
                      weddingDate: invitation.organizations['wedding']!.date,
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  final double width;
  final double height;

  const LoadingView({this.width= 160, this.height= 160, super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Assets.animations.anWeddingRing.lottie(width: width, height: height),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.warmCream,
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: AppColors.deepRose, size: 48),
            const SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(
                color: AppColors.mutedBrown,
                fontSize: 15,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
