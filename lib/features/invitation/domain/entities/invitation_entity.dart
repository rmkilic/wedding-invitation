import 'package:wedding_invidatiton/features/invitation/domain/entities/event_organization_entity.dart';
import 'family_entity.dart';

class InvitationEntity {
  final String brideName;
  final String groomName;
  final String message;
  final FamilyEntity family;
  final Map<String, EventOrganizationEntity> organizations;

  const InvitationEntity({
    required this.brideName,
    required this.groomName,
    required this.message,
    required this.family,
    required this.organizations,
  });
}