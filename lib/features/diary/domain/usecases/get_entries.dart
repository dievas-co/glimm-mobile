import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/core/errors/failures.dart';
import 'package:glimm/features/diary/domain/entities/diary_entry.dart';
import 'package:glimm/features/diary/domain/repositories/diary_repository.dart';

@lazySingleton
class GetEntries {
  final DiaryRepository repository;

  GetEntries(this.repository);

  Future<Either<Failure, List<DiaryEntry>>> call() async {
    return repository.getEntries();
  }
}
