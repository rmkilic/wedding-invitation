import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService {
  final FirebaseRemoteConfig remoteConfig;

  FirebaseRemoteConfigService(this.remoteConfig);

  Future<void> initialize() async {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 30),
        minimumFetchInterval:  Duration.zero,
      ),
    );
  }

  Future<void> fetchAndActivate() async {
    await remoteConfig.fetchAndActivate();
  }

  String getString(String key) {
    return remoteConfig.getString(key);
  }
}