import 'package:injectable/injectable.dart';
import 'package:glimm/core/network/api_client.dart';
import 'package:glimm/core/errors/failures.dart';

abstract class AuthRemoteDataSource {
  Future<void> login(String firebaseToken);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<void> login(String firebaseToken) async {
    try {
      await apiClient.post('/auth/login', token: firebaseToken);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
