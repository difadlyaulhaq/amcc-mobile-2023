import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    FirebaseAuth auth = FirebaseAuth.instance;
    on<AuthEventLogin>((event, emit) async{
      try {
        emit(AuthStateLoading());
        await auth.signInWithEmailAndPassword(email: event.email, password: event.password);
        emit(AuthStateLogin());
      } on FirebaseAuthException catch (e){
        emit(AuthStateError(e.toString()));
      }catch (e) {
        emit(AuthStateError(e.toString())); 

      }
    });
    
    on<AuthEventRegister>((event, emit) async{
      try {
        emit(AuthStateLoading());
        await auth.createUserWithEmailAndPassword(email: event.email, password: event.password);
        emit(AuthStateRegister());
      } on FirebaseAuthException catch (e) {
        emit(AuthStateError(e.message.toString()));
      } catch (e){
        emit(AuthStateError(e.toString()));
      }
    },);
  }
}
