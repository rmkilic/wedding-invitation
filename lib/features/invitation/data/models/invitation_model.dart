import 'package:wedding_invidatiton/features/invitation/data/models/event_organization_model.dart';

import '../../domain/entities/invitation_entity.dart';

class InvitationModel extends InvitationEntity {
  const InvitationModel({
    required super.brideName,
    required super.groomName,
    required super.backgroundImageUrl,
    required super.organizations,
  });

  factory InvitationModel.fromMap(Map<String, dynamic> map) {
    return InvitationModel(
      brideName: map['brideName'] ?? '',
      groomName: map['groomName'] ?? '',
      backgroundImageUrl: map['backgroundImageUrl'] ?? '',
      organizations: List<EventOrganizationModel>.from(
      (map['organizations'] as List).map(
        (e) => EventOrganizationModel.fromMap(e),
      ),
),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brideName': brideName,
      'groomName': groomName,
      'backgroundImageUrl': backgroundImageUrl,
      'organizations': organizations
        .map((e) => (e as EventOrganizationModel).toMap())
        .toList(),
    };
  }
}

//TODO: json

/* {
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
} */