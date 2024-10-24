part of 'crud_bloc.dart';

@immutable
sealed class CrudEvent {}

final class AddNoteEvent extends CrudEvent {
  final String title;
  final String content;

  AddNoteEvent({required this.title, required this.content});
}

final class FetchNotesEvent extends CrudEvent {}

final class UpdateNoteEvent extends CrudEvent {
  final String noteId;
  final String title;
  final String content;

  UpdateNoteEvent({required this.noteId, required this.title, required this.content});
}

final class DeleteNoteEvent extends CrudEvent {
  final String noteId;

  DeleteNoteEvent({required this.noteId});
}
