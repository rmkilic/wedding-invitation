import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_invidatiton/core/theme/app_colors.dart';
import 'package:wedding_invidatiton/core/widgets/app_loading.dart';
import 'package:wedding_invidatiton/core/widgets/background.dart';
import 'package:wedding_invidatiton/core/widgets/error_view.dart';
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
            return const AppLoading();
          }

          if (state is InvitationError) {
            return ErrorView(message: state.message);
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




