
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_invidatiton/core/error/failure.dart';
import 'package:wedding_invidatiton/features/invitation/domain/usecases/get_invitation_usecase.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/bloc/invitation_event.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/bloc/invitation_state.dart';

class InvitationBloc extends Bloc<InvitationEvent, InvitationState>{
  final GetInvitationUseCase getInvitationUseCase;
   InvitationBloc(this.getInvitationUseCase) : super(InvitationInitial()){
      on<GetInvitationRequested>(_onGetInvitationRequest);
   }


  Future<void> _onGetInvitationRequest(GetInvitationRequested event, Emitter<InvitationState> emit)async{
    emit(InvitationLoading());

    try{
      final invitation = await getInvitationUseCase.fetch();

      emit(InvitationLoaded(invitation));
    } on Failure
    catch(e){
      emit(InvitationError(e.message));
    }
  }

}