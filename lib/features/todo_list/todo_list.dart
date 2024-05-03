import 'package:todo/core/data/models/task.dart';
import 'package:todo/core/services/ads/yandex_ads/banner/banner_ad.dart';
import 'package:todo/features/todo_list/bloc/todo_list_bloc.dart';
import 'package:todo/core/utils/components/todo_card.dart';
import 'package:todo/features/todo_list/widgets/todo_search.dart';
import 'package:todo/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksListPage extends StatelessWidget {
  const TasksListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TasksListView();
  }
}

class TasksListView extends StatefulWidget {
  const TasksListView({
    super.key,
  });

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TasksListBloc>(context);
    bloc.add(const LoadTasksListEvent());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          children: [
            const BannerAdWidget(
              isSticky: true,
            ),
            const TaskSearch(),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: BlocBuilder<TasksListBloc, TasksListState>(
                    builder: (context, state) {
                  if (state.taskListStatus == TasksListStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.taskListStatus == TasksListStatus.loaded) {
                    final List<TaskModel> tasks = state.listTaskModel;
                    if (tasks.isNotEmpty) {
                      return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: tasks.length,
                        itemBuilder: (context, index) =>
                            TaskCard(index: index, task: tasks[index]),
                      );
                    } else {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Align(
                          child: Text(
                            S.of(context).emptyTasksList,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ));
                    }
                  }
                  if (state.taskListStatus == TasksListStatus.searchLoaded) {
                    final List<TaskModel> tasks = state.sortedListTaskModel;

                    if (tasks.isNotEmpty) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: tasks.length,
                        itemBuilder: (context, index) =>
                            TaskCard(index: index, task: tasks[index]),
                      );
                    } else {
                      return Center(
                          child: Text(
                        S.of(context).tasksNotFound,
                      ));
                    }
                  }
                  return const SizedBox();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
