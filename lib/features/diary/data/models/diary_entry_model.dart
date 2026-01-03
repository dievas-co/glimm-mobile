import 'package:isar/isar.dart';

part 'diary_entry_model.g.dart';

@collection
class DiaryEntryModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String clientId;

  late String encryptedContent;

  @Index()
  late DateTime entryDate;

  @Index()
  late bool isSynced;

  late bool isDeleted;

  late DateTime createdAt;
  late DateTime updatedAt;
}
