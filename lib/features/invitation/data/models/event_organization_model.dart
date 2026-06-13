import '../../domain/entities/event_organization_entity.dart';

class EventOrganizationModel
    extends EventOrganizationEntity {

  const EventOrganizationModel({
    required super.title,
    required super.hallName,
    required super.address,
    required super.latitude,
    required super.longitude,
    required super.date,
  });

  factory EventOrganizationModel.fromMap(
    Map<String, dynamic> map,
  ) {

    return EventOrganizationModel(
      title: map['title'] ?? '',
      hallName: map['hallName'] ?? '',
      address: map['address'] ?? '',
      latitude: (map['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (map['longitude'] as num?)?.toDouble() ?? 0.0,
      date: map['date'] is String ? DateTime.parse(map['date']) : map['date'] ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {

    return {
      'title': title,
      'hallName': hallName,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'date': date.toIso8601String()
    };
  }
}