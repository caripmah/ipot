class EnvConfig {
  EnvConfig._();

  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.ipot.example.com',
  );

  /// Set USE_MOCK=true (default) to use MockApiService.
  /// Set USE_MOCK=false to hit the real API (requires API_BASE_URL).
  ///
  /// Usage:
  ///   flutter run                                        → mock (default)
  ///   flutter run --dart-define=USE_MOCK=false \
  ///               --dart-define=API_BASE_URL=https://...  → real API
  static const useMock = bool.fromEnvironment(
    'USE_MOCK',
    defaultValue: true,
  );
}
