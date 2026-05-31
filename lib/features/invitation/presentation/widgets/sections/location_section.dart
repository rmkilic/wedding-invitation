import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entities/event_organization_entity.dart';

class LocationSection extends StatelessWidget {

  final List<EventOrganizationEntity> organizations;

  const LocationSection({
    super.key,
    required this.organizations,
  });

  Future<void> _openMap(
    EventOrganizationEntity location,
  ) async {

    final url =
        'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}';

    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(24),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          const Text(
            'Organizasyon Lokasyonları',

            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          ...organizations.map(
            (location) {

              return Container(
                margin:
                    const EdgeInsets.only(
                  bottom: 16,
                ),

                padding:
                    const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(16),

                  color: Colors.white,

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black
                          .withOpacity(0.08),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      location.title,

                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(location.hallName),

                    const SizedBox(height: 4),

                    Text(location.address),

                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: () {
                        _openMap(location);
                      },

                      child: const Text(
                        'Yol Tarifi Al',
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}