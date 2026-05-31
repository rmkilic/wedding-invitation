import 'package:wedding_invidatiton/features/invitation/domain/entities/invitation_entity.dart';
import 'package:wedding_invidatiton/features/invitation/domain/repositories/invitation_repository.dart';

class GetInvitationUseCase {
  final InvitationRepository repository;
  GetInvitationUseCase(this.repository);


  Future<InvitationEntity> fetch() async{
    return await repository.getInvitation();
  }
}