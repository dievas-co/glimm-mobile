import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/core/errors/failures.dart';
import 'package:glimm/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class SignOut {
  final AuthRepository repository;

  SignOut(this.repository);

  Future<Either<Failure, void>> call() async {
    return repository.signOut();
  }
}
