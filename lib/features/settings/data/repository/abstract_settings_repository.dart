import 'package:todo/core/error/failure.dart';
import 'package:todo/features/settings/data/datasource/settings_local_data_source.dart';
import 'package:todo/features/settings/data/models/day_time_notification.dart';
import 'package:todo/features/settings/data/models/settings.dart';
import 'package:dartz/dartz.dart';

abstract interface class AbstractSettingsRepository {
  Future<Either<Failure, TimeNotification>> getNotificationDayTime();
  Future<Either<Failure, void>> setNotificationDayTime(
      TimeNotification notificationDay);
  Future<Either<Failure, String>> getLanguage();
  Future<Either<Failure, void>> setLanguage(String lang);
  Future<Either<Failure, String>> getDateFormat();
  Future<Either<Failure, void>> setDateFormat(String dateFormat);
  Future<Either<Failure, String>> getTheme();
  Future<Either<Failure, void>> setTheme(AppThemeMode theme);
  Future<Either<Failure, SettingsModel>> getSettingsData();
}
