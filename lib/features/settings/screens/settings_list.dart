import 'package:auto_route/auto_route.dart';
import 'package:todo/features/backup_restore/bloc/google_drive_bloc.dart';
import 'package:todo/core/services/google_drive/google_drive_service.dart';
import 'package:todo/core/utils/components/action_button.dart';
import 'package:todo/core/utils/date_utils/date_utils.dart';
import 'package:todo/features/settings/bloc/bloc/settings_bloc.dart';
import 'package:todo/features/settings/widgets/setting_tile.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleDriveBloc(context.read<GoogleDriveService>()),
      child: const SettingsPageView(),
    );
  }
}

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    String mapperTheme(String themeMode) {
      switch (themeMode) {
        case "light":
          return S.of(context).lightThemeModeName;
        case "dark":
          return S.of(context).darkThemeModeName;
        case "system":
          return S.of(context).systemThemeModeName;
        default:
          return S.of(context).systemThemeModeName;
      }
    }

    return BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
      if (state.status == SettingsStatus.login) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('You have successfully logged in')),
        // );
        AutoRouter.of(context).push(const BackupRestoreRoute());
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).settings),
          centerTitle: true,
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () {
                BlocProvider.of<SettingsBloc>(context).add(GoogleDriveLogin());
              },
              child: Container(
                height: 140,
                margin: const EdgeInsets.all(14.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: const Offset(220, -30),
                      child: Transform.rotate(
                          angle: 50,
                          child: Image.asset(
                              'assets/images/Google_Drive_Logo.png')),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              S.of(context).backupOnGoogleDrive,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(S.of(context).doNotLoseDataWhenChangingYourDevice),
                        const SizedBox(
                          height: 17,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child:
                              ActionButton(text: S.of(context).createABackup),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(14, 5, 14, 5),
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SettingTile(
                      icon: const Icon(Icons.notifications_on_outlined),
                      title: S.of(context).notification,
                      subtitle: S.of(context).notifyInDatetimeNHoursminutes(
                          DateTimeUtils.formatDate(
                              DateTime(0, 0, 0, state.dayTimeNotification.hour,
                                  state.dayTimeNotification.minute),
                              "HH:mm")),
                      onTap: () {
                        AutoRouter.of(context)
                            .push(const SettingsNotificationRoute());
                      }),
                  SettingTile(
                      icon: const Icon(Icons.language_outlined),
                      title: S.of(context).language,
                      subtitle: mapperLanguage(state.language),
                      onTap: () {
                        AutoRouter.of(context)
                            .push(const LanguageSelectionRoute());
                      }),
                  SettingTile(
                    icon: const Icon(Icons.date_range_outlined),
                    title: S.of(context).dateFormat,
                    subtitle: state.dateFormat,
                    onTap: () {
                      AutoRouter.of(context)
                          .push(const DateFormatSelectionRoute());
                    },
                  ),
                  SettingTile(
                    icon: const Icon(Icons.color_lens_outlined),
                    title: S.of(context).theme,
                    subtitle: mapperTheme(state.theme.localization),
                    onTap: () {
                      AutoRouter.of(context).push(const ThemeSelectionRoute());
                    },
                  ),
                  SettingTile(
                    icon: const Icon(Icons.info_outline),
                    title: S.of(context).info,
                    onTap: () {
                      AutoRouter.of(context).push(InfoRoute());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

String mapperLanguage(String langCode) {
  switch (langCode) {
    case "ru":
      return "Русский";
    case "en":
      return "English";
    default:
      return "Русский";
  }
}
