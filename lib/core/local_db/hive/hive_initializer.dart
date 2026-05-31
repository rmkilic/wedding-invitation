

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:wedding_invidatiton/core/local_db/hive/hive_boxes.dart';

class HiveInitializer {

  static Future<void> init()async{
    await Hive.initFlutter();

    await Hive.openBox(HiveBoxes.invitationBox);
  }
}