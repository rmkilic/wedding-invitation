import 'package:wedding_invidatiton/features/invitation/domain/entities/invitation_entity.dart';

abstract class InvitationRepository{

  Future<InvitationEntity> getInvitation();
}