import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:wedding_invidatiton/core/local_db/local_db_manager.dart';

class HiveLocalDbManager implements LocalDbManager{
  final Box box;

  HiveLocalDbManager(this.box);
  @override
  Future<void> delete(Enum key) async {
     await box.delete(key.name);
  }

  @override
  T? get<T>(Enum key) {
    return box.get(key.name) as T?;
  }

  @override
  Future<void> save<T>(Enum key, T data) async {
    try{
      await box.put(key.name, data);
    }catch(e)
    {
      throw Exception(e);
    }
  }


}