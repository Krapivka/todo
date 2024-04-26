import 'package:auto_route/auto_route.dart';
import 'package:todo/core/data/models/task.dart';
import 'package:todo/core/utils/animations/show_up.dart';
import 'package:todo/core/utils/date_utils/date_utils.dart';
import 'package:todo/features/settings/bloc/bloc/settings_bloc.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.index,
  });
  final TaskModel task;
  final int index;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool _visible = false;

  void animate() async {
    await Future.delayed(const Duration(milliseconds: 300)).then((value) {
      if (mounted) {
        setState(() {
          _visible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      animate();
      return AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              child: Material(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),

                  onTap: () {
                    AutoRouter.of(context)
                        .push(UpdateTaskRoute(taskmodel: widget.task));
                  },
                  // child: Dismissible(
                  //   key: UniqueKey(),
                  //   background: const Card(
                  //     color: Color.fromARGB(255, 253, 253, 253),
                  //     child: Icon(Icons.delete),
                  //   ),
                  //   onDismissed: (direction) {
                  //     bloc.add(DeleteTaskTasksListEvent(id: task.id));
                  //   },

                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: ListTile(
                        title: Text(widget.task.title,
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                        subtitle: ShowUp(
                            delay: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    S.of(context).turnsN(widget.task.dateTime)),
                                Text(DateTimeUtils.formatDate(
                                    widget.task.dateTime, state.dateFormat)),
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
              )));
    });
  }
}
