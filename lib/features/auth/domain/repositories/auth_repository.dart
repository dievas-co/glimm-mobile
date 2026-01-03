import 'package:dartz/dartz.dart';
import 'package:glimm/core/errors/failures.dart';
import 'package:glimm/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
  Future<Option<User>> getCurrentUser();
}
