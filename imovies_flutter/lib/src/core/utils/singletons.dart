import 'package:get_it/get_it.dart';
import 'package:imovies_flutter/src/core/utils/api_client.dart';

GetIt singleton = GetIt.instance;

Future<void> initSingletons() async {
  singleton.registerSingleton<ApiClient>(ApiClientImplementation());

  await singleton<ApiClient>().init();
}
