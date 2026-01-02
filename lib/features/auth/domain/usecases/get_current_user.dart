import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/features/auth/domain/entities/user.dart';
import 'package:glimm/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class GetCurrentUser {
  final AuthRepository repository;

  GetCurrentUser(this.repository);

  Future<Option<User>> call() async {
    return repository.getCurrentUser();
  }
}
