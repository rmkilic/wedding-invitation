import 'package:wedding_invidatiton/features/invitation/domain/entities/event_organization_entity.dart';

class InvitationEntity {
  final String brideName;
  final String groomName;
  final String backgroundImageUrl;
  final List<EventOrganizationEntity> organizations;

  const InvitationEntity({
    required this.brideName,
    required this.groomName,
    required this.backgroundImageUrl,
    required this.organizations,
  });
}