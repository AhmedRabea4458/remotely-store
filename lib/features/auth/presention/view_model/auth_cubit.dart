import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:remotely_store/features/auth/data/repositories/auth_repository.dart';

import '../../data/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  StreamSubscription? _authSubscription;

  AuthCubit(this.repository) : super(AuthInitial()) {
    checkAuthStatus();
  }

  void checkAuthStatus() {
    _authSubscription = repository.authStateChanges().listen((user) {
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    });
  }

  Future<void> register({
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      emit(AuthLoading());
      await repository.register(email,phone, password);
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }


  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      await repository.login(email, password);
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(AuthLoading());
      await repository.signInWithGoogle();
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
  Future<void> signInWithFacebook() async {
    try {
      emit(AuthLoading());
      await repository.signInWithFacebook();
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    await repository.logout();
    emit(Unauthenticated());
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
