import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:wedding_invidatiton/core/error/exceptions.dart';
import 'package:wedding_invidatiton/core/error/failure.dart';
import 'package:wedding_invidatiton/features/invitation/data/datasources/invitation_local_data_source.dart';
import 'package:wedding_invidatiton/features/invitation/data/datasources/invitation_remote_data_source.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/invitation_entity.dart';
import 'package:wedding_invidatiton/features/invitation/domain/repositories/invitation_repository.dart';

class InvitationRepositoryImpl  implements InvitationRepository{
  final InvitationRemoteDataSource remoteDataSource;
  final InvitationLocalDataSource localDataSource;

  InvitationRepositoryImpl(this.remoteDataSource, this.localDataSource);
  @override
  Future<InvitationEntity> getInvitation() async{
    try{
     
      final invitation = await remoteDataSource.getInvitation();
      unawaited(
      localDataSource
          .cacheInvitation(
            invitation,
          )
          .catchError(
            (e, s) {
              // TODO: logger
              debugPrint('[ERROR - REPOSITORY] InvitationRepositoryImpl : $e');
            },
          ),
    );
    return invitation;
    }on RemoteConfigException{
      final cachedInvitation =
        await localDataSource
            .getCachedInvitation();

        if (cachedInvitation != null) {
          return cachedInvitation;
        }
       throw RemoteConfigFailure();
    }
  }

}