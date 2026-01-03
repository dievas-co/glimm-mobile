import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/core/errors/failures.dart';
import 'package:glimm/features/auth/domain/entities/user.dart' as domain;
import 'package:glimm/features/auth/domain/repositories/auth_repository.dart';
import 'package:glimm/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:glimm/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource firebaseAuthDataSource;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.firebaseAuthDataSource, this.authRemoteDataSource);

  @override
  Future<Either<Failure, domain.User>> signInWithGoogle() async {
    try {
      final firebaseUser = await firebaseAuthDataSource.signInWithGoogle();

      if (firebaseUser == null) {
        return Left(const AuthFailure('Google Sign-In cancelled'));
      }

      final token = await firebaseUser.getIdToken();
      if (token == null) {
        return Left(const AuthFailure('Failed to get Firebase token'));
      }

      // Verify with backend
      await authRemoteDataSource.login(token);

      return Right(_mapToDomainUser(firebaseUser));
    } catch (e) {
      if (e is Failure) return Left(e);
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await firebaseAuthDataSource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Option<domain.User>> getCurrentUser() async {
    try {
      final firebaseUser = firebaseAuthDataSource.getCurrentUser();
      if (firebaseUser != null) {
        return Some(_mapToDomainUser(firebaseUser));
      }
      return const None();
    } catch (e) {
      return const None();
    }
  }

  domain.User _mapToDomainUser(firebase.User user) {
    return domain.User(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }
}
