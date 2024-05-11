import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:todo/core/domain/enteties/note_entity.dart';
import 'package:todo/core/domain/repositories/note_repository.dart';
import 'package:todo/core/utils/components/action_button.dart';
import 'package:todo/core/utils/date_utils/date_utils.dart';
import 'package:todo/features/note/bloc/note_bloc.dart';
import 'package:todo/features/settings/bloc/bloc/settings_bloc.dart';
import 'package:todo/generated/l10n.dart';

import '../../core/services/ads/yandex_ads/banner/banner_ad.dart';

@RoutePage()
class NotePage extends StatelessWidget {
  NotePage({
    super.key,
    this.note,
  });
  final NoteEntity? note;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(
          RepositoryProvider.of<AbstractNoteRepository>(context), note),
      child: NoteView(),
    );
  }
}

class NoteView extends StatelessWidget {
  NoteView({super.key});
  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NoteBloc>(context);
    final settingsBloc = BlocProvider.of<SettingsBloc>(context);
    bloc.add(NoteLoadEvent());

    return BlocConsumer<NoteBloc, NoteState>(listener: (context, state) {
      if (state.noteStatus == NoteStatus.saved) {
        AutoRouter.of(context).pushNamed("/");
      }
    }, builder: (context, state) {
      if (state.noteStatus == NoteStatus.loaded) {
        noteTitleController.text = bloc.state.title;
        noteDescController.text = bloc.state.note;
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(S.of(context).selectColor),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  pickerColor: state.color,
                                  onColorChanged: (color) {
                                    bloc.add(ColorChangedEvent(color: color));
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              // actions: <Widget>[
                              //   ActionButton(text: 'Change color'),

                              //   //     Navigator.of(context).pop();
                              //   //   },
                              //   // ),
                              // ],
                            ));
                  },
                  icon: Icon(
                    Icons.color_lens_rounded,
                    color: state.color,
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Column(
              children: [
                const BannerAdWidget(
                  isSticky: true,
                ),

                TextField(
                  controller: noteTitleController,
                  onChanged: (title) {
                    BlocProvider.of<NoteBloc>(context)
                        .add(TitleChangedEvent(title: title));
                  },
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    hintText: S.of(context).titleNote,
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 28),
                ),
                Row(
                  children: [
                    Text(DateTimeUtils.formatDate(
                        DateTime.now(), settingsBloc.state.dateFormat)),
                    const Text("  |  "),
                    Text(state.note.length.toString())
                  ],
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      controller: noteDescController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (value) {
                        BlocProvider.of<NoteBloc>(context)
                            .add(NoteChangedEvent(note: value));
                      },
                      enableInteractiveSelection: true,
                      decoration: InputDecoration(
                        hintText: S.of(context).startTyping,
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                // child: TextFieldTaskChanges(
                //   controller: noteController,
                //   hintText: S.of(context).enterTheTextOfTheNote,
                //   onChanged: (value) {
                //     // BlocProvider.of<NoteBloc>(context)
                //     //     .add(NoteChangedEvent(note: value));
                //   }, Start typing
                // ),

                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: _ButtonAddNote(),
                ),
              ],
            ),
          ),
        );
      }
      return const SizedBox();
    });
  }
}

class _ButtonAddNote extends StatelessWidget {
  const _ButtonAddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.read<NoteBloc>().add(const NoteSaveEvent());
        },
        child: ActionButton(
          text: S.of(context).addTaskButton,
        ));
  }
}

// class NoteView extends StatelessWidget {
//   NoteView({super.key});
//   TextEditingController noteController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final bloc = BlocProvider.of<NoteBloc>(context);
//     bloc.add(NoteLoadEvent());

//     return Padding(
//       padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
//       child: Column(
//         children: [
//           const BannerAdWidget(
//             isSticky: true,
//           ),
//           Expanded(
//             child: BlocConsumer<NoteBloc, NoteState>(
//               listener: (context, state) {
//                 if (state.noteStatus == NoteStatus.loaded) {
//                   noteController.text = bloc.state.note;
//                 }
//                 if (state.noteStatus == NoteStatus.saved) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       AppSnackBar.getSnackBar(S.of(context).theNoteIsSaved));
//                 }
//                 if (state.noteStatus == NoteStatus.cleared) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       AppSnackBar.getSnackBar(S.of(context).deleted));
//                 }
//               },
//               builder: (context, state) {
//                 return BlocBuilder<NoteBloc, NoteState>(
//                     builder: (context, state) {
//                   return TextFieldTaskChanges(
//                     controller: noteController,
//                     hintText: S.of(context).enterTheTextOfTheNote,
//                     onChanged: (value) {
//                       BlocProvider.of<NoteBloc>(context)
//                           .add(NoteChangedEvent(note: value));
//                     },
//                   );
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
