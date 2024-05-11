part of 'note_bloc.dart';

enum NoteStatus { initial, loading, loaded, failure, saved, cleared }

class NoteState {
  NoteState({title, note, color, noteStatus})
      : noteStatus = noteStatus ?? NoteStatus.initial,
        title = title ?? "",
        note = note ?? "",
        color = color ?? const Color.fromARGB(220, 184, 184, 184);

  final String title;
  final String note;
  final Color color;
  final NoteStatus noteStatus;
  List<Object> get props => [note];

  NoteState copyWith({
    Color? color,
    String? title,
    String? note,
    NoteStatus? noteStatus,
  }) {
    return NoteState(
      color: color ?? this.color,
      title: title ?? this.title,
      note: note ?? this.note,
      noteStatus: noteStatus ?? this.noteStatus,
    );
  }
}
