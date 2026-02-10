part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}


class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final UserModel user;
  Authenticated(this.user);
}

class Unauthenticated extends AuthState {}
class Guest extends AuthState {}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
