import 'package:wedding_invidatiton/features/invitation/data/models/event_organization_model.dart';

import '../../domain/entities/invitation_entity.dart';

class InvitationModel extends InvitationEntity {
  const InvitationModel({
    required super.brideName,
    required super.groomName,
    required super.backgroundImageUrl,
    required super.organizations,
  });

  factory InvitationModel.fromMap(Map<String, dynamic> map) {
    return InvitationModel(
      brideName: map['brideName'] ?? '',
      groomName: map['groomName'] ?? '',
      backgroundImageUrl: map['backgroundImageUrl'] ?? '',
      organizations: List<EventOrganizationModel>.from(
      (map['organizations'] as List).map(
        (e) => EventOrganizationModel.fromMap(e),
      ),
),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brideName': brideName,
      'groomName': groomName,
      'backgroundImageUrl': backgroundImageUrl,
      'organizations': organizations
        .map((e) => (e as EventOrganizationModel).toMap())
        .toList(),
    };
  }
}