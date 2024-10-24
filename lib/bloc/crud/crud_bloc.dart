import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  final FirebaseFirestore firestore;

  CrudBloc({required this.firestore}) : super(CrudInitial()) {
    // Add Note
    on<AddNoteEvent>((event, emit) async {
      emit(CrudLoading());
      try {
        await firestore.collection('notes').add({
          'title': event.title,
          'content': event.content,
          'createdAt': FieldValue.serverTimestamp(),
        });
        emit(CrudNoteAdded());
      } catch (e) {
        emit(CrudError(e.toString()));
      }
    });

    // Fetch Notes
    on<FetchNotesEvent>((event, emit) async {
      emit(CrudLoading());
      try {
        QuerySnapshot snapshot = await firestore.collection('notes').orderBy('createdAt').get();
        List<Map<String, dynamic>> notes = snapshot.docs.map((doc) {
          return {
            'id': doc.id,
            'title': doc['title'],
            'content': doc['content'],
          };
        }).toList();
        emit(CrudLoaded(notes: notes));
      } catch (e) {
        emit(CrudError(e.toString()));
      }
    });

    // Update Note
    on<UpdateNoteEvent>((event, emit) async {
      emit(CrudLoading());
      try {
        await firestore.collection('notes').doc(event.noteId).update({
          'title': event.title,
          'content': event.content,
        });
        emit(CrudNoteUpdated());
      } catch (e) {
        emit(CrudError(e.toString()));
      }
    });

    // Delete Note
    on<DeleteNoteEvent>((event, emit) async {
      emit(CrudLoading());
      try {
        await firestore.collection('notes').doc(event.noteId).delete();
        emit(CrudNoteDeleted());
      } catch (e) {
        emit(CrudError(e.toString()));
      }
    });
  }
}
