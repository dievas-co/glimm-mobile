import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/core/errors/failures.dart';
import 'package:glimm/features/diary/data/datasources/diary_local_datasource.dart';
import 'package:glimm/features/diary/data/datasources/diary_remote_datasource.dart';
import 'package:glimm/features/diary/data/models/diary_entry_model.dart';
import 'package:glimm/features/diary/domain/entities/diary_entry.dart';
import 'package:glimm/features/diary/domain/repositories/diary_repository.dart';
import 'package:glimm/core/encryption/crypto_service.dart';
import 'package:glimm/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: DiaryRepository)
class DiaryRepositoryImpl implements DiaryRepository {
  final DiaryLocalDataSource localDataSource;
  final DiaryRemoteDataSource remoteDataSource;
  final CryptoService cryptoService;
  final AuthRepository authRepository;

  DiaryRepositoryImpl(
    this.localDataSource,
    this.remoteDataSource,
    this.cryptoService,
    this.authRepository,
  );

  @override
  Future<Either<Failure, List<DiaryEntry>>> getEntries() async {
    try {
      await localDataSource.init();

      final models = await localDataSource.getEntries();
      final userOption = await authRepository.getCurrentUser();

      return userOption.fold(() => Left(const AuthFailure('User not found')), (
        user,
      ) async {
        final entries = <DiaryEntry>[];
        for (final model in models) {
          try {
            final content = await cryptoService.decrypt(
              model.encryptedContent,
              user.id,
            );
            entries.add(
              DiaryEntry(
                clientId: model.clientId,
                content: content,
                entryDate: model.entryDate,
                isSynced: model.isSynced,
                createdAt: model.createdAt,
              ),
            );
          } catch (e) {
            continue;
          }
        }
        return Right(entries);
      });
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createEntry(String content) async {
    try {
      final userOption = await authRepository.getCurrentUser();

      return await userOption.fold(
        () => Future.value(Left(const AuthFailure('User not found'))),
        (user) async {
          final encryptedContent = await cryptoService.encrypt(
            content,
            user.id,
          );
          final now = DateTime.now();
          final clientId = '${now.millisecondsSinceEpoch}-${content.hashCode}';

          final model = DiaryEntryModel()
            ..clientId = clientId
            ..encryptedContent = encryptedContent
            ..entryDate = now
            ..isSynced = false
            ..isDeleted = false
            ..createdAt = now
            ..updatedAt = now;

          await localDataSource.saveEntry(model);

          return const Right(null);
        },
      );
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteEntry(String clientId) async {
    try {
      await localDataSource.deleteEntry(clientId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sync() async {
    try {
      final unsynced = await localDataSource.getUnsyncedEntries();
      if (unsynced.isEmpty) return const Right(null);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
