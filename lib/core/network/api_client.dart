import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:glimm/core/errors/failures.dart';

@lazySingleton
class ApiClient {
  final http.Client client;
  // Android emulator uses 10.0.2.2 for localhost
  // iOS simulator uses localhost
  static const String _baseUrl = 'http://10.0.2.2:8080/api/v1';

  String get baseUrl => _baseUrl;

  ApiClient(this.client);

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    String? token,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await client.post(
        Uri.parse('$_baseUrl$path'),
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );

      return _handleResponse(response);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  Future<dynamic> get(String path, {String? token}) async {
    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await client.get(
        Uri.parse('$_baseUrl$path'),
        headers: headers,
      );

      return _handleResponse(response);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      return jsonDecode(response.body);
    } else {
      throw ServerFailure('Request failed with status: ${response.statusCode}');
    }
  }
}
