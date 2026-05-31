import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:wedding_invidatiton/core/local_db/hive/hive_boxes.dart';
import 'package:wedding_invidatiton/core/local_db/hive/hive_local_db_manager.dart';
import 'package:wedding_invidatiton/core/services/firebase_remote_config_service.dart';
import 'package:wedding_invidatiton/features/invitation/data/datasources/invitation_locale_data_soruce.dart';

import '../features/invitation/data/datasources/invitation_remote_data_source.dart';
import '../features/invitation/data/repositories/invitation_repository_impl.dart';
import '../features/invitation/domain/usecases/get_invitation_usecase.dart';
import '../features/invitation/presentation/bloc/invitation_bloc.dart';

InvitationBloc createInvitationBloc() {
  final remoteDataSource =
      InvitationRemoteDataSourceImpl(FirebaseRemoteConfigService(FirebaseRemoteConfig.instance));
  final localDataSource = InvitationLocalDataSourceImpl(HiveLocalDbManager(Hive.box(HiveBoxes.invitationBox)));
  final repository =
      InvitationRepositoryImpl(
    remoteDataSource,
    localDataSource
  );

  final useCase =
      GetInvitationUseCase(
    repository,
  );

  return InvitationBloc(useCase);
}