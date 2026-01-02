import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/core/errors/failures.dart';
import 'package:glimm/features/auth/domain/entities/user.dart';
import 'package:glimm/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  Future<Either<Failure, User>> call() async {
    return repository.signInWithGoogle();
  }
}
