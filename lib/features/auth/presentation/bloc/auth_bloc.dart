import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/features/auth/domain/entities/user.dart';
import 'package:glimm/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:glimm/features/auth/domain/usecases/sign_out.dart';
import 'package:glimm/features/auth/domain/usecases/get_current_user.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;
  const factory AuthEvent.signInWithGoogle() = _SignInWithGoogle;
  const factory AuthEvent.signOut() = _SignOut;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(String message) = _Error;
}

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogle _signInWithGoogle;
  final SignOut _signOut;
  final GetCurrentUser _getCurrentUser;

  AuthBloc(this._signInWithGoogle, this._signOut, this._getCurrentUser)
    : super(const _Initial()) {
    on<_CheckAuthStatus>(_onCheckAuthStatus);
    on<_SignInWithGoogle>(_onSignInWithGoogle);
    on<_SignOut>(_onSignOut);
  }

  Future<void> _onCheckAuthStatus(
    _CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    final userOption = await _getCurrentUser();
    emit(
      userOption.fold(
        () => const AuthState.unauthenticated(),
        (user) => AuthState.authenticated(user),
      ),
    );
  }

  Future<void> _onSignInWithGoogle(
    _SignInWithGoogle event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _signInWithGoogle();
    emit(
      result.fold(
        (failure) => AuthState.error(failure.message),
        (user) => AuthState.authenticated(user),
      ),
    );
  }

  Future<void> _onSignOut(_SignOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    await _signOut();
    emit(const AuthState.unauthenticated());
  }
}
