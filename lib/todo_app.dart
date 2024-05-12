import 'package:todo/core/domain/repositories/note_repository.dart';
import 'package:todo/core/domain/repositories/task_repository.dart';

import 'package:todo/core/utils/theme/theme.dart';
import 'package:todo/features/home/cubit/home_cubit.dart';
import 'package:todo/features/settings/bloc/bloc/settings_bloc.dart';
import 'package:todo/features/settings/data/repository/abstract_settings_repository.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

late final Size windowSize;

class App extends StatelessWidget {
  final AbstractTaskRepository taskRepository;
  final AbstractSettingsRepository settingsRepository;
  final AbstractNoteRepository noteRepository;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static const String name = 'Task Calendar';
  static const Color mainColor = Colors.deepPurple;

  const App({
    super.key,
    required this.taskRepository,
    required this.settingsRepository,
    required this.noteRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: taskRepository,
          ),
          RepositoryProvider.value(
            value: settingsRepository,
          ),
          RepositoryProvider.value(
            value: noteRepository,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
            BlocProvider(
                create: (context) => SettingsBloc(
                    settingsRepository:
                        RepositoryProvider.of<AbstractSettingsRepository>(
                            context))
                  ..add(const InitializeSettingsEvent())),
          ],
          child: const AppView(),
        ));
  }
}

class AppView extends StatefulWidget {
  const AppView({
    super.key,
  });

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      if (state.status == SettingsStatus.initial) {
        windowSize = MediaQuery.of(context).size;
      }
      if (state.status == SettingsStatus.success) {
        return MaterialApp.router(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale(state.language),
          debugShowCheckedModeBanner: false,
          title: 'Task Calendar',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: state.theme.themeMode,
          routerConfig: _appRouter.config(),
        );
      } else {
        return const Placeholder();
      }
    });
  }
}
