import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_entry.freezed.dart';

@freezed
class DiaryEntry with _$DiaryEntry {
  const factory DiaryEntry({
    required String clientId,
    required String content,
    required DateTime entryDate,
    required bool isSynced,
    required DateTime createdAt,
  }) = _DiaryEntry;
}
