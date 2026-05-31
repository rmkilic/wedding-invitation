import 'package:equatable/equatable.dart';

abstract class InvitationEvent extends Equatable{
  const InvitationEvent();

    @override
      List<Object?> get props => [];
}

class GetInvitationRequested extends InvitationEvent{}