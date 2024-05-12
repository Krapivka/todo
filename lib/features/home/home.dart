import 'package:auto_route/auto_route.dart';
import 'package:todo/core/domain/repositories/note_repository.dart';
import 'package:todo/core/domain/repositories/task_repository.dart';
import 'package:todo/features/note_list/bloc/note_list_bloc.dart';
import 'package:todo/features/note_list/note_list.dart';
import 'package:todo/features/todo_list/todo_list.dart';
import 'package:todo/features/todo_list/bloc/todo_list_bloc.dart';
import 'package:todo/features/calendar/calendar.dart';
import 'package:todo/features/home/cubit/home_cubit.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings/data/repository/abstract_settings_repository.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => TasksListBloc(
            RepositoryProvider.of<AbstractTaskRepository>(context),
            RepositoryProvider.of<AbstractSettingsRepository>(context)),
      ),
      BlocProvider(
        create: (context) => NotesListBloc(
          RepositoryProvider.of<AbstractNoteRepository>(context),
        ),
      )
    ], child: const HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    final notesListBloc = BlocProvider.of<NotesListBloc>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const SettingsRoute());
              },
              icon: const Icon(Icons.menu)),
          title: Text(selectedTab.index == 0
              ? S.of(context).notes
              : selectedTab.index == 1
                  ? S.of(context).tasks
                  : S.of(context).calendar),
          centerTitle: true,
          actions: [
            BlocBuilder<NotesListBloc, NotesListState>(
              builder: (context, state) {
                return BlocBuilder<TasksListBloc, TasksListState>(
                  builder: (context, state) {
                    bool isDelTask = (state.selectedTaskId.isNotEmpty &&
                        (selectedTab.index == 1 || selectedTab.index == 2));
                    bool isDelNote =
                        ((notesListBloc.state.selectedNoteId.isNotEmpty &&
                            selectedTab.index == 0));
                    return Visibility(
                      visible: isDelTask || isDelNote,
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          if (isDelNote) {
                            BlocProvider.of<NotesListBloc>(context)
                                .add(const DeleteNoteNotesListEvent());
                          }
                          if (isDelTask) {
                            BlocProvider.of<TasksListBloc>(context)
                                .add(const DeleteTaskTasksListEvent());
                          }
                        },
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          selectedIndex: selectedTab.index,
          onDestinationSelected: (index) {
            context.read<HomeCubit>().setTab(index);
          },
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: const Icon(Icons.note_add),
              icon: const Icon(Icons.note_add_outlined),
              label: S.of(context).notes,
            ),
            NavigationDestination(
              selectedIcon: const Icon(Icons.task),
              icon: const Icon(Icons.task_outlined),
              label: S.of(context).tasks,
            ),
            NavigationDestination(
              selectedIcon: const Icon(Icons.calendar_month),
              icon: const Icon(Icons.calendar_month_outlined),
              label: S.of(context).calendar,
            ),
            const NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              label: "",
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: selectedTab.index == 0
            ? FloatingActionButton(
                onPressed: () {
                  AutoRouter.of(context).push(NoteRoute());
                },
                child: const Icon(
                  Icons.add,
                ))
            : FloatingActionButton(
                onPressed: () {
                  AutoRouter.of(context).push(const AddingTaskRoute());
                },
                child: const Icon(
                  Icons.add,
                )),
        body: IndexedStack(
          index: selectedTab.index,
          children: const [
            NotesListPage(),
            TasksListPage(),
            CalendarPage(),
          ],
        ));
  }
}
