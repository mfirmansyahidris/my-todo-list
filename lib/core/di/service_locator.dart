import 'package:get_it/get_it.dart';
import 'package:mtodolist/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  sl.registerLazySingleton<TodoRepository>(() => TodoRepository());
}

/// register prefManager
void initPrefManager(SharedPreferences initPrefManager) {
  sl.registerLazySingleton<PrefManager>(() => PrefManager(initPrefManager));
}
