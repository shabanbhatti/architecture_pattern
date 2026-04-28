import 'package:api_integration/core/service/shared_pref_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> initGetIt() async {
  var sp = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => SharedPrefService(sharedPreferences: sp));
}
