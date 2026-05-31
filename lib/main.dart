import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_invidatiton/core/local_db/hive/hive_initializer.dart';
import 'package:wedding_invidatiton/core/services/firebase_remote_config_service.dart';
import 'package:wedding_invidatiton/injection/injection.dart';

import 'features/invitation/presentation/bloc/invitation_event.dart';
import 'features/invitation/presentation/pages/invitation_page.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await HiveInitializer.init();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 final remoteConfigService =
      FirebaseRemoteConfigService(
    FirebaseRemoteConfig.instance,
  );

  await remoteConfigService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => createInvitationBloc()..add(GetInvitationRequested()),
        child: const InvitationPage(),
      ),
    );
  }
}