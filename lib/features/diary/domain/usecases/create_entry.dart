import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/core/errors/failures.dart';
import 'package:glimm/features/diary/domain/repositories/diary_repository.dart';

@lazySingleton
class CreateEntry {
  final DiaryRepository repository;

  CreateEntry(this.repository);

  Future<Either<Failure, void>> call(String content) async {
    return repository.createEntry(content);
  }
}
