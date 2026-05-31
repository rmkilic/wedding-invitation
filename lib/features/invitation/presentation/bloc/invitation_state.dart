import 'package:equatable/equatable.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/invitation_entity.dart';

abstract class InvitationState extends Equatable{

  const InvitationState();

  @override
  List<Object?> get props => [];
}

class InvitationInitial extends InvitationState{}

class InvitationLoading extends InvitationState{}

class InvitationLoaded extends InvitationState{
  final InvitationEntity invitation;
  const InvitationLoaded(this.invitation);

  @override
  List<Object?> get props => [];
}

class InvitationError extends InvitationState{
    final String message;

  const InvitationError(this.message);

  @override
  List<Object?> get props => [message];
}


