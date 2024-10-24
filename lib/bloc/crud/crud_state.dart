part of 'crud_bloc.dart';

@immutable
abstract class CrudState {}

final class CrudInitial extends CrudState {}

final class CrudLoading extends CrudState {}

final class CrudLoaded extends CrudState {
  final List<Map<String, dynamic>> notes;

  CrudLoaded({required this.notes});
}

final class CrudError extends CrudState {
  final String errorMessage;

  CrudError(this.errorMessage);
}

final class CrudNoteAdded extends CrudState {}

final class CrudNoteUpdated extends CrudState {}

final class CrudNoteDeleted extends CrudState {}
