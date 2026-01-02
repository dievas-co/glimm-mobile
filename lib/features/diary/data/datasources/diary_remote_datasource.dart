import 'package:injectable/injectable.dart';
import 'package:glimm/core/network/api_client.dart';
import 'package:glimm/features/diary/data/models/diary_entry_model.dart';

abstract class DiaryRemoteDataSource {
  Future<void> syncEntries(List<DiaryEntryModel> entries, String token);
  Future<List<dynamic>> fetchUpdates(DateTime since, String token);
}

@LazySingleton(as: DiaryRemoteDataSource)
class DiaryRemoteDataSourceImpl implements DiaryRemoteDataSource {
  final ApiClient apiClient;

  DiaryRemoteDataSourceImpl(this.apiClient);

  @override
  Future<void> syncEntries(List<DiaryEntryModel> entries, String token) async {
    for (final entry in entries) {
      if (entry.isDeleted) {
        await apiClient.client.delete(
          Uri.parse('${apiClient.baseUrl}/diaries/${entry.clientId}'),
          headers: {'Authorization': 'Bearer $token'},
        );
      } else {
        await apiClient.post(
          '/diaries',
          token: token,
          body: {
            'clientId': entry.clientId,
            'encryptedContent': entry.encryptedContent,
            'entryDate': entry.entryDate.toIso8601String(),
          },
        );
      }
    }
  }

  @override
  Future<List<dynamic>> fetchUpdates(DateTime since, String token) async {
    final response = await apiClient.get(
      '/diaries/sync?since=${since.toIso8601String()}',
      token: token,
    );
    return response as List<dynamic>;
  }
}
