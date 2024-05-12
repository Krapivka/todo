import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/data/datasources/note_local_data_source.dart';
import 'package:todo/core/data/datasources/task_local_data_source.dart';
import 'package:todo/core/data/repositories/note_repository_impl.dart';
import 'package:todo/core/data/repositories/task_repository_impl.dart';
import 'package:todo/core/services/ads/yandex_ads/open_ad/app_open_ad_manager.dart';
import 'package:todo/core/services/notification/notification_service.dart';
import 'package:todo/features/settings/data/datasource/settings_local_data_source.dart';
import 'package:todo/features/settings/data/repository/settings_repository.dart';
import 'package:todo/firebase_options.dart';
import 'package:yandex_mobileads/mobile_ads.dart';
import 'todo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initializ mob ads
  MobileAds.initialize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((app) => debugPrint(app.options.toString()));
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  await analytics.logAppOpen();
  //loading open ad
  // GetIt.I.registerSingleton<AppOpenAdManager>(AppOpenAdManager());
  // GetIt.I<AppOpenAdManager>().loadAppOpenAd();

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

  runApp(App(
      taskRepository: taskRepository,
      settingsRepository: settingsRepository,
      noteRepository: noteRepository));
}
