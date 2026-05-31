import 'dart:convert';

import 'package:wedding_invidatiton/core/error/exceptions.dart';
import 'package:wedding_invidatiton/core/services/firebase_remote_config_service.dart';
import 'package:wedding_invidatiton/features/invitation/data/models/invitation_model.dart';

abstract class InvitationRemoteDataSource {
  Future<InvitationModel> getInvitation();
}

class InvitationRemoteDataSourceImpl
    implements InvitationRemoteDataSource {
      final FirebaseRemoteConfigService  remoteConfig;

  InvitationRemoteDataSourceImpl(this.remoteConfig);
  
  @override
  Future<InvitationModel> getInvitation() async {
    try{
       await remoteConfig.fetchAndActivate();
      final jsonString = remoteConfig.getString('invidatiton_data');
      final map = jsonDecode(jsonString);
      return InvitationModel.fromMap(map);
    }catch (e){
      throw RemoteConfigException();
    }
  }

}
/*
{
  "brideName": "Rauf Mümin",
  "groomName": "Elif",
  "backgroundImageUrl": "https://images.unsplash.com/photo-1511285560929-80b456fea0bc",
  "organizations": [
    {
      "title": "Kına",
      "hallName": "Piraziz Öğretmen Evi",
      "date": "2026-07-26T19:00:00.000",
      "address": "Yeni, 28340 Piraziz/Giresun",
      "latitude": 40.95327684640598,
      "longitude": 38.12494787975824
    },
    {
      "title": "Düğün & Nikah",
      "hallName": "Kılıç Center Şato",
      "date": "2026-07-27T19:00:00.000",
      "address": "Kılıç Mobilya Center, İsmet Paşa, Fatih Cd., 28300 Bulancak/Giresun",
      "latitude": 40.94030606112292,
      "longitude": 38.239843885454576
    }
  ]
}



*/