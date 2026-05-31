import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/event_organization_entity.dart';

import '../../../domain/entities/invitation_entity.dart';

class HeroSection extends StatelessWidget {

  final InvitationEntity invitation;
  final EventOrganizationEntity hennaOrganization;
  final EventOrganizationEntity weddingOrganization;
  const HeroSection({
    required this.invitation,
    required this.hennaOrganization,
    required this.weddingOrganization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery.of(context).size.height,

      child: Stack(
        fit: StackFit.expand,
        children: [

          Image.network(
            invitation.backgroundImageUrl,
            fit: BoxFit.cover,
          ),

          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Text(
                    '${invitation.brideName} & ${invitation.groomName}',

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),

                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  Text( DateFormat('yyyy-MM-dd HH:mm:ss').format(hennaOrganization.date),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    hennaOrganization.hallName,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
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