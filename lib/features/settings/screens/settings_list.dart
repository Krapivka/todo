import 'package:auto_route/auto_route.dart';
import 'package:todo/core/utils/date_utils/date_utils.dart';
import 'package:todo/features/settings/bloc/bloc/settings_bloc.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsPageView();
  }
}

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).settings),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.notifications_on_outlined),
                title: Text(S.of(context).notification),
                subtitle: Text(S.of(context).notifyInDatetimeNHoursminutes(
                    DateTimeUtils.formatDate(
                        DateTime(0, 0, 0, state.dayTimeNotification.hour,
                            state.dayTimeNotification.minute),
                        "HH:mm"))),
                onTap: () {
                  AutoRouter.of(context)
                      .push(const SettingsNotificationRoute());
                },
              ),
              ListTile(
                leading: const Icon(Icons.language_outlined),
                title: Text(S.of(context).language),
                subtitle: MapperLanguage(langCode: state.language),
                onTap: () {
                  AutoRouter.of(context).push(const LanguageSelectionRoute());
                },
              ),
              ListTile(
                leading: const Icon(Icons.date_range_outlined),
                title: Text(S.of(context).dateFormat),
                subtitle: Text(state.dateFormat),
                onTap: () {
                  AutoRouter.of(context).push(const DateFormatSelectionRoute());
                },
              ),
              ListTile(
                leading: const Icon(Icons.color_lens_outlined),
                title: Text(S.of(context).theme),
                subtitle: MapperTheme(themeMode: state.theme.localization),
                onTap: () {
                  AutoRouter.of(context).push(const ThemeSelectionRoute());
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(S.of(context).info),
                onTap: () {
                  AutoRouter.of(context).push(InfoRoute());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class MapperLanguage extends StatelessWidget {
  final String langCode;
  const MapperLanguage({super.key, required this.langCode});

  @override
  Widget build(BuildContext context) {
    switch (langCode) {
      case "ru":
        return const Text("Русский");
      case "en":
        return const Text("English");
      default:
        return const Text("Русский");
    }
  }
}

class MapperTheme extends StatelessWidget {
  final String themeMode;
  const MapperTheme({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    switch (themeMode) {
      case "light":
        return Text(S.of(context).lightThemeModeName);
      case "dark":
        return Text(S.of(context).darkThemeModeName);
      case "system":
        return Text(S.of(context).systemThemeModeName);
      default:
        return Text(S.of(context).systemThemeModeName);
    }
  }
}
