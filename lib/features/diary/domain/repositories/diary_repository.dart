import 'package:dartz/dartz.dart';
import 'package:glimm/core/errors/failures.dart';
import 'package:glimm/features/diary/domain/entities/diary_entry.dart';

abstract class DiaryRepository {
  Future<Either<Failure, List<DiaryEntry>>> getEntries();
  Future<Either<Failure, void>> createEntry(String content);
  Future<Either<Failure, void>> deleteEntry(String clientId);
  Future<Either<Failure, void>> sync();
}
