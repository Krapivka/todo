import 'package:dartz/dartz.dart';
import 'package:todo/core/domain/enteties/note_entity.dart';
import 'package:todo/core/error/failure.dart';

abstract class AbstractNoteRepository {
  Future<Either<Failure, void>> addNote(NoteEntity note);
  Future<Either<Failure, void>> deleteNote(int id);
  Future<Either<Failure, void>> updateNote(NoteEntity note);
  Future<Either<Failure, List<NoteEntity>>> searchNote(String query);
  Future<Either<Failure, List<NoteEntity>>> getAllNotes();
  Future<int> lastIndex();
}
