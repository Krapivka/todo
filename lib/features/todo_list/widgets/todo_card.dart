import 'package:auto_route/auto_route.dart';
import 'package:todo/core/data/models/task.dart';
import 'package:todo/core/utils/animations/show_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:todo/core/utils/date_utils/date_utils.dart';
import 'package:todo/features/todo_list/bloc/todo_list_bloc.dart';
import 'package:todo/features/settings/bloc/bloc/settings_bloc.dart';
import 'package:todo/router/router.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.index,
  });
  final TaskModel task;
  final int index;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _visible = false;

  void animateCard() async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      if (mounted) {
        _visible = false;
        setState(() {
          _visible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final file = File(widget.task.filePath);
    final settingsBloc = context.watch<SettingsBloc>();
    final taskListBloc = BlocProvider.of<TasksListBloc>(context);

    return BlocBuilder<TasksListBloc, TasksListState>(
      builder: (context, state) {
        //use animate when widget rebuild
        animateCard();
        return AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Material(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  if (state.selectedTaskId.isEmpty) {
                    AutoRouter.of(context)
                        .push(UpdateTaskRoute(taskmodel: widget.task));
                  } else {
                    taskListBloc.add(TapTaskCardEvent(id: widget.task.id));
                  }
                },
                onLongPress: () {
                  taskListBloc.add(LongPressTaskCardEvent(id: widget.task.id));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: taskListBloc.state.selectedTaskId
                            .contains(widget.task.id)
                        ? const Color.fromARGB(255, 223, 223, 223)
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  child: ListTile(
                      // leading: CircleAvatar(
                      //   radius: 28,
                      //   backgroundImage: widget.task.filePath == "/"
                      //       ? const AssetImage("assets/images/avatar.png")
                      //       : FileImage(file) as ImageProvider,
                      // ),
                      title: ShowUp(
                        delay: 100,
                        child: Text(widget.task.title,
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                      subtitle: ShowUp(
                          delay: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(S.of(context).turnsN(widget.task.turns)),
                              Text(DateTimeUtils.formatDate(
                                  widget.task.dateTime,
                                  settingsBloc.state.dateFormat)),
                            ],
                          )),
                      trailing: DateTimeUtils.getDifferenceCurrentDayTask(
                                  widget.task.dateTime) !=
                              '0'
                          ? Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 1),
                              ),
                              child: Center(
                                  child: Text(
                                DateTimeUtils.getDifferenceCurrentDayTask(
                                    widget.task.dateTime),
                                style: const TextStyle(fontSize: 12),
                              )))
                          : SizedBox(
                              height: 40,
                              width: 40,
                              child: SvgPicture.asset(
                                  'assets/images/confetti.svg',
                                  semanticsLabel: 'Confetti'),
                            )),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
