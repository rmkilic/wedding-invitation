import 'package:wedding_invidatiton/features/invitation/data/models/event_organization_model.dart';
import 'package:wedding_invidatiton/features/invitation/data/models/family_model.dart';

import '../../domain/entities/invitation_entity.dart';

class InvitationModel extends InvitationEntity {
  const InvitationModel({
    required super.brideName,
    required super.groomName,
    required super.message,
    required super.family,
    required super.organizations,
  });

  factory InvitationModel.fromMap(Map<String, dynamic> map) {
    return InvitationModel(
      brideName: map['brideName'] ?? '',
      groomName: map['groomName'] ?? '',
      message: map['message'] ?? '',
      family: FamilyModel.fromMap(map['family']),
      organizations: Map<String, EventOrganizationModel>.from(
        (map['organizations'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, EventOrganizationModel.fromMap(value)),
        ),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brideName': brideName,
      'groomName': groomName,
      'message': message,
      'family': (family as FamilyModel).toMap(),
      'organizations': organizations.map(
        (key, value) => MapEntry(key, (value as EventOrganizationModel).toMap()),
      ),
    };
  }
}
   