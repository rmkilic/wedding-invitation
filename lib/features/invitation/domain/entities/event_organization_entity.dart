class EventOrganizationEntity {

  final String title;
  final String hallName;
  final DateTime date;
  final String address;
  final double latitude;
  final double longitude;

  const EventOrganizationEntity({
    required this.title,
    required this.hallName,
    required this.date,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}