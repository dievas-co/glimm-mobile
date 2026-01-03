abstract final class AppConstants {
  static const String appName = 'Glimm';

  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8080/api/v1',
  );

  static const int syncIntervalMinutes = 15;
  static const int maxImagesPerEntry = 4;
  static const int maxContentLength = 10000;
}
