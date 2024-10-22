part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthStateLogin extends AuthState{}

final class AuthStateLoading extends AuthState {}

final class AuthStateLogout extends AuthState {}

final class AuthStateRegister extends AuthState {}

final class AuthStateError extends AuthState {
  final String message;

  AuthStateError(this.message);
}
