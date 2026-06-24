import 'dart:convert';

import 'package:wedding_invidatiton/core/error/exceptions.dart';
import 'package:wedding_invidatiton/core/services/firebase_remote_config_service.dart';
import 'package:wedding_invidatiton/features/invitation/data/models/invitation_model.dart';

abstract class InvitationRemoteDataSource {
  Future<InvitationModel> getInvitation();
}

class InvitationRemoteDataSourceImpl implements InvitationRemoteDataSource {
  final FirebaseRemoteConfigService remoteConfig;

  InvitationRemoteDataSourceImpl(this.remoteConfig);

  @override
  Future<InvitationModel> getInvitation() async {
    try {
      await remoteConfig.fetchAndActivate();
      final jsonString = remoteConfig.getString('invidatiton_data');
      final map = jsonDecode(jsonString);
      return InvitationModel.fromMap(map);
    } catch (e) {
      throw RemoteConfigException();
    }
  }
}
