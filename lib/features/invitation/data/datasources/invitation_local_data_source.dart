import 'dart:convert';

import 'package:wedding_invidatiton/core/local_db/local_db_manager.dart';
import 'package:wedding_invidatiton/features/invitation/constant/invitation_local_db_key.dart';
import 'package:wedding_invidatiton/features/invitation/data/models/invitation_model.dart';

abstract class InvitationLocalDataSource {

  Future<void> cacheInvitation(InvitationModel data);

  Future<InvitationModel?> getCachedInvitation();
}

class InvitationLocalDataSourceImpl implements InvitationLocalDataSource{
  final LocalDbManager localDb;

  InvitationLocalDataSourceImpl(this.localDb);

  @override
  Future<void> cacheInvitation(InvitationModel data) async{
    final jsonString = jsonEncode(data.toMap());
    
    await localDb.save(InvitationLocalDbKey.invitation, jsonString);
  }

  @override
  Future<InvitationModel?> getCachedInvitation() async{
    final jsonString = localDb.get(InvitationLocalDbKey.invitation);

    if(jsonString == null){
      return null;
    }
    final map = jsonDecode(jsonString
    );
    return InvitationModel.fromMap(map);
  }

}