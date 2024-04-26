import 'package:auto_route/auto_route.dart';
import 'package:todo/core/domain/repositories/task_repository.dart';
import 'package:todo/features/todo_list/todo_list.dart';
import 'package:todo/features/todo_list/bloc/todo_list_bloc.dart';
import 'package:todo/features/calendar/calendar.dart';
import 'package:todo/features/home/cubit/home_cubit.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TasksListBloc(
            RepositoryProvider.of<AbstractTaskRepository>(context)),
        child: const HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const SettingsRoute());
              },
              icon: const Icon(Icons.menu)),
          title: const Text(
            "Tasks",
          ),
          centerTitle: true,
          actions: [
            BlocBuilder<TasksListBloc, TasksListState>(
              builder: (context, state) {
                return Visibility(
                  visible:
                      state.selectedTaskId.isNotEmpty && selectedTab.index == 0,
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<TasksListBloc>(context)
                          .add(const DeleteTaskTasksListEvent());
                    },
                  ),
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
              selectedIcon: const Icon(Icons.home),
              icon: const Icon(Icons.home_outlined),
              label: S.of(context).tasks,
            ),
            NavigationDestination(
              selectedIcon: const Icon(Icons.calendar_month),
              icon: const Icon(Icons.calendar_month_outlined),
              label: S.of(context).calendar,
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AutoRouter.of(context).push(const AddingTaskRoute());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: IndexedStack(
          index: selectedTab.index,
          children: const [TasksListPage(), CalendarPage()],
        ));
  }
}
