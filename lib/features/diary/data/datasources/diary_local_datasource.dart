import 'package:isar/isar.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/features/diary/data/models/diary_entry_model.dart';
import 'package:glimm/core/errors/failures.dart';
import 'package:path_provider/path_provider.dart';

abstract class DiaryLocalDataSource {
  Future<void> init();
  Future<List<DiaryEntryModel>> getEntries({int limit = 20, int offset = 0});
  Future<void> saveEntry(DiaryEntryModel entry);
  Future<void> deleteEntry(String clientId);
  Future<List<DiaryEntryModel>> getUnsyncedEntries();
  Future<void> markAsSynced(String clientId);
}

@LazySingleton(as: DiaryLocalDataSource)
class DiaryLocalDataSourceImpl implements DiaryLocalDataSource {
  Isar? _isar;

  @override
  Future<void> init() async {
    if (_isar != null) return;

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([DiaryEntryModelSchema], directory: dir.path);
  }

  Isar get isar {
    if (_isar == null) {
      throw const CacheFailure('Isar not initialized');
    }
    return _isar!;
  }

  @override
  Future<List<DiaryEntryModel>> getEntries({
    int limit = 20,
    int offset = 0,
  }) async {
    return isar.diaryEntryModels
        .where()
        .filter()
        .isDeletedEqualTo(false)
        .sortByEntryDateDesc()
        .offset(offset)
        .limit(limit)
        .findAll();
  }

  @override
  Future<void> saveEntry(DiaryEntryModel entry) async {
    await isar.writeTxn(() async {
      await isar.diaryEntryModels.put(entry);
    });
  }

  @override
  Future<void> deleteEntry(String clientId) async {
    await isar.writeTxn(() async {
      final entry = await isar.diaryEntryModels
          .filter()
          .clientIdEqualTo(clientId)
          .findFirst();

      if (entry != null) {
        entry.isDeleted = true;
        entry.isSynced = false;
        entry.updatedAt = DateTime.now();
        await isar.diaryEntryModels.put(entry);
      }
    });
  }

  @override
  Future<List<DiaryEntryModel>> getUnsyncedEntries() async {
    return isar.diaryEntryModels.filter().isSyncedEqualTo(false).findAll();
  }

  @override
  Future<void> markAsSynced(String clientId) async {
    await isar.writeTxn(() async {
      final entry = await isar.diaryEntryModels
          .filter()
          .clientIdEqualTo(clientId)
          .findFirst();

      if (entry != null) {
        entry.isSynced = true;
        await isar.diaryEntryModels.put(entry);
      }
    });
  }
}
