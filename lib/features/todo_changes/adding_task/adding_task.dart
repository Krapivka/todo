import 'package:auto_route/auto_route.dart';
import 'package:todo/core/domain/repositories/task_repository.dart';
import 'package:todo/core/utils/constants/Palette.dart';
import 'package:todo/core/utils/snack_bar/snack_bar.dart';
import 'package:todo/features/todo_changes/adding_task/bloc/adding_task_bloc.dart';
import 'package:todo/features/todo_changes/widgets/text_field_todo_changes.dart';
import 'package:todo/features/settings/data/repository/abstract_settings_repository.dart';
import 'package:todo/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/router/router.dart';

@RoutePage()
class AddingTaskPage extends StatelessWidget {
  const AddingTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddingTaskBloc(
        context.read<AbstractTaskRepository>(),
        context.read<AbstractSettingsRepository>(),
      ),
      child: const AddingTaskView(),
    );
  }
}

class AddingTaskView extends StatelessWidget {
  const AddingTaskView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddingTaskBloc, AddingTaskState>(
      listener: (context, state) {
        if (state.status == AddingTaskStatus.validatorFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              AppSnackBar.getSnackBar(S.of(context).fillInTheRequiredFields));
        }
        if (state.status == AddingTaskStatus.success) {
          AutoRouter.of(context).pushAndPopUntil(const HomeRoute(),
              predicate: (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                S.of(context).addTask,
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //  const EditableAvatar(),
                    TextFieldTaskChanges(
                      labelText: S.of(context).enterNameInTextField,
                      hintText: S.of(context).hintTextNameInTextField,
                      onChanged: (value) {
                        context
                            .read<AddingTaskBloc>()
                            .add(AddingTaskTitleChanged(value));
                      },
                      icon: const Icon(Icons.task),
                    ),
                    SizedBox(
                      height: 100,
                      child: DatePicker(onDateTimeChanged: (DateTime value) {
                        BlocProvider.of<AddingTaskBloc>(context)
                            .add(AddingTaskDateTap(value));
                      }),
                    ),
                    // _TextField(
                    //   labelText: "Enter date",
                    //   hintText: "Date",
                    //   showCursor: false,
                    //   controller: dataController,
                    //   onTap: () async {
                    //     final bloc = BlocProvider.of<AddingTaskBloc>(context);
                    //     final birthdate = await showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime(1900),
                    //         lastDate: DateTime.now());

                    //     if (birthdate != null) {
                    //       bloc.add(AddingBirtdayDateTap(birthdate));
                    //       dataController.text =
                    //           birthdate.toString().split(' ')[0];
                    //     }
                    //   },
                    //   icon: const Icon(Icons.date_range_outlined),
                    // ),
                    const _ButtonAddTask(),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

// class EditableAvatar extends StatelessWidget {
//   const EditableAvatar();

//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.watch<AddingTaskBloc>();
//     final width = MediaQuery.of(context).size.width / 3;
//     // final avatarPath = bloc.state.file.absolute.path;
//     return Center(
//       child: Material(
//         child: InkWell(
//           borderRadius: BorderRadius.circular(100),
//           onTap: () {
//             bloc.add(const AddingBirtdayImageTap());
//           },
//           child: Ink(
//             color: Theme.of(context).colorScheme.primary,
//             child: Stack(children: [
//               CircleAvatar(
//                   radius: width / 1.3,
//                   backgroundImage: avatarPath == '/'
//                       ? const AssetImage("assets/images/avatar.png")
//                       : FileImage(bloc.state.file) as ImageProvider),
//               Positioned(
//                 right: 0,
//                 bottom: 0,
//                 child: FloatingActionButton(
//                   mini: true,
//                   onPressed: () {
//                     bloc.add(const AddingBirtdayImageTap());
//                   },
//                   child: const Icon(Icons.brush),
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

class _ButtonAddTask extends StatelessWidget {
  const _ButtonAddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<AddingTaskBloc>().add(const AddingTaskSubmitted());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.primaryAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            S.of(context).addTaskButton,
            style: const TextStyle(color: Palette.secondaryLight),
          ),
        ),
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  const DatePicker({super.key, required this.onDateTimeChanged});

  final void Function(DateTime) onDateTimeChanged;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddingTaskBloc, AddingTaskState>(
      builder: (context, state) {
        return CupertinoDatePicker(
            minimumDate: DateTime(1930),
            maximumDate: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            initialDateTime: state.dateTime,
            onDateTimeChanged: onDateTimeChanged);
      },
    );
  }
}
