
abstract class LocalDbManager {

  Future<void> save<T>(Enum key, T data);
  T? get<T>(Enum key);
  Future<void> delete(Enum key);
}