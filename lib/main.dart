import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/data/datasources/note_local_data_source.dart';
// import 'package:talker_bloc_logger/talker_bloc_logger.dart';
// import 'package:talker_flutter/talker_flutter.dart';
import 'package:todo/core/data/datasources/task_local_data_source.dart';
import 'package:todo/core/data/repositories/note_repository_impl.dart';
import 'package:todo/core/data/repositories/task_repository_impl.dart';
import 'package:todo/core/services/ads/yandex_ads/open_ad/app_open_ad_manager.dart';
import 'package:todo/core/services/notification/notification_service.dart';
import 'package:todo/features/settings/data/datasource/settings_local_data_source.dart';
import 'package:todo/features/settings/data/repository/settings_repository.dart';
import 'package:yandex_mobileads/mobile_ads.dart';
import 'todo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final talker = TalkerFlutter.init();
  // GetIt.I.registerSingleton<Talker>(talker);
  // GetIt.I<Talker>().debug("Talker started...");
  // //creating when our feature register first

  // Bloc.observer = TalkerBlocObserver(
  //   settings: const TalkerBlocLoggerSettings(
  //     printEventFullData: false,
  //     printStateFullData: false,
  //   ),
  // );

  //initializ mob ads
  MobileAds.initialize();

  //loading open ad
  GetIt.I.registerSingleton<AppOpenAdManager>(AppOpenAdManager());
  GetIt.I<AppOpenAdManager>().loadAppOpenAd();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  GetIt.I.registerSingletonAsync<PackageInfo>(() async {
    packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  });

  //initialize notification service
  await NotificationService.initializeNotifications();

  //initialize local storage
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  final taskRepository = TaskRepository(
    localDataSource:
        TaskLocalDataSourceImpl(sharedPreferences: sharedPreferences),
  );

  final settingsRepository = SettingsRepository(
    localDataSource:
        SettingsLocalDataSource(sharedPreferences: sharedPreferences),
  );

  final noteRepository = NoteRepository(
    localDataSource:
        NoteLocalDataSourceImpl(sharedPreferences: sharedPreferences),
  );

  // FlutterError.onError =
  //     ((details) => GetIt.I<Talker>().handle(details.exception, details.stack));
  // runZonedGuarded(
  //     () =>
  runApp(App(
      taskRepository: taskRepository,
      settingsRepository: settingsRepository,
      noteRepository: noteRepository));
  //     ),
  // (e, st) => GetIt.I<Talker>().handle(e, st));
}
