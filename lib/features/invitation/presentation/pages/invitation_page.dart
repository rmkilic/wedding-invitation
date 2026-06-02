import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_invidatiton/core/widgets/app_loading.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/sections/countdown_section.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/sections/hero_sections.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/sections/location_section.dart';

import '../bloc/invitation_bloc.dart';
import '../bloc/invitation_state.dart';

class InvitationPage extends StatelessWidget {
  const InvitationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<
          InvitationBloc,
          InvitationState>(
        builder: (context, state) {

          if (state is InvitationLoading) {
            return AppLoading();
          }

          if (state is InvitationError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is InvitationLoaded) {

            final invitation = state.invitation;

              return ListView(
    children: [

      HeroSection(
        invitation: invitation,
        hennaOrganization: invitation.organizations.first,
        weddingOrganization: invitation.organizations.last,
      ),
      CountdownSection(weddingDate: invitation.organizations.first.date,),
      LocationSection(organizations: invitation.organizations,)

    ],
  );
            
            }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}